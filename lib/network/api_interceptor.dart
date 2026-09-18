import 'package:dio/dio.dart';
import 'package:food_drink_delivery/router/route_config.dart';
import 'package:food_drink_delivery/storage/secure_storage.dart';
import 'package:go_router/go_router.dart';

class ApiInterceptor extends QueuedInterceptor {
  final Dio dio;
  final SecureStorage secureStorage;

  late final Dio _tokenDio;

  ApiInterceptor({
    required this.dio,
    required this.secureStorage,
  }) {
    _tokenDio = Dio(
      BaseOptions(
        baseUrl: dio.options.baseUrl,
        connectTimeout: dio.options.connectTimeout,
        receiveTimeout: dio.options.receiveTimeout,
      ),
    );
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await secureStorage.read('accessToken');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;
    final isUnauthorized = err.response?.statusCode == 401;
    final isRefreshRequest = requestOptions.path.contains('/v1/auth/refresh');
    final hasRetried = requestOptions.extra['hasRetried'] == true;

    if (!isUnauthorized || isRefreshRequest || hasRetried) {
      handler.next(err);
      return;
    }

    final currentAccessToken = await secureStorage.read('accessToken');
    final requestAuthHeader =
        requestOptions.headers['Authorization'] as String?;

    // 1. Kiểm tra nếu Token đã được làm mới trước đó bởi một request khác
    if (currentAccessToken != null &&
        requestAuthHeader != 'Bearer $currentAccessToken') {
      requestOptions.headers['Authorization'] = 'Bearer $currentAccessToken';
      requestOptions.extra['hasRetried'] = true;
      try {
        final response = await dio.fetch(requestOptions);
        return handler.resolve(response);
      } on DioException catch (retryError) {
        return handler.next(retryError);
      }
    }

    // 2. Lấy refreshToken để tiến hành refresh
    final refreshToken = await secureStorage.read('refreshToken');
    if (refreshToken == null || refreshToken.isEmpty) {
      await _handleLogout();
      handler.next(err);
      return;
    }

    // 3. Gọi API refresh token bằng _tokenDio riêng biệt
    try {
      final response = await _tokenDio.post<Map<String, dynamic>>(
        '/v1/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final data = response.data?['data'];
      final newAccessToken = data is Map<String, dynamic>
          ? data['accessToken'] as String?
          : null;
      final newRefreshToken = data is Map<String, dynamic>
          ? data['refreshToken'] as String?
          : null;

      if (newAccessToken == null || newAccessToken.isEmpty) {
        throw StateError('Refresh token response has no valid access token');
      }

      await secureStorage.write('accessToken', newAccessToken);
      if (newRefreshToken != null && newRefreshToken.isNotEmpty) {
        await secureStorage.write('refreshToken', newRefreshToken);
      }

      // 4. Retry request thất bại ban đầu bằng token mới qua dio của app
      requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
      requestOptions.extra['hasRetried'] = true;

      final retryResponse = await dio.fetch(requestOptions);
      handler.resolve(retryResponse);
    } catch (_) {
      await _handleLogout();
      handler.next(err);
    }
  }

  Future<void> _handleLogout() async {
    await secureStorage.delete('accessToken');
    await secureStorage.delete('refreshToken');

    final context = RouteConfig.navigationKey.currentContext;
    if (context != null && context.mounted) {
      context.goNamed(RouteConfig.login);
    }
  }
}