import 'package:dio/dio.dart';
import 'package:food_drink_delivery/di/injection.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository.dart';
import 'package:food_drink_delivery/storage/secure_storage.dart';

class ApiInterceptor extends Interceptor {
  final SecureStorage secureStorage = SecureStorage();
  Future<bool>? _refreshingToken;
  final authRepository = sl<AuthRepository>();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await secureStorage.read('accessToken');
    if (token != null) {
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
    final isRefreshRequest = requestOptions.path == '/v1/auth/refresh';
    final hasRetried = requestOptions.extra['hasRetried'] == true;

    if (!isUnauthorized || isRefreshRequest || hasRetried) {
      handler.next(err);
      return;
    }

    final refreshToken = await secureStorage.read('refreshToken');
    if (refreshToken == null) {
      handler.next(err);
      return;
    }

    _refreshingToken ??= _refreshAccessToken(
      refreshToken,
      requestOptions.baseUrl,
    );
    final refreshed = await _refreshingToken!;
    _refreshingToken = null;

    if (!refreshed) {
      handler.next(err);
      return;
    }

    final accessToken = await secureStorage.read('accessToken');
    if (accessToken == null) {
      handler.next(err);
      return;
    }

    requestOptions.headers['Authorization'] = 'Bearer $accessToken';
    requestOptions.extra['hasRetried'] = true;

    try {
      final response = await Dio().fetch(requestOptions);
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  Future<bool> _refreshAccessToken(
    String refreshToken,
    String baseUrl,
  ) async {
    try {
      final response = await Dio(
        BaseOptions(baseUrl: baseUrl),
      ).post<Map<String, dynamic>>(
        '/v1/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      final data = response.data?['data'];
      final accessToken = data is Map<String, dynamic>
          ? data['accessToken']
          : null;
      final newRefreshToken = data is Map<String, dynamic>
          ? data['refreshToken']
          : null;

      if (accessToken is! String || accessToken.isEmpty) {
        throw StateError('Refresh token response has no access token');
      }

      await secureStorage.write('accessToken', accessToken);
      if (newRefreshToken is String && newRefreshToken.isNotEmpty) {
        await secureStorage.write('refreshToken', newRefreshToken);
      }
      return true;
    } catch (_) {
      await secureStorage.delete('accessToken');
      await secureStorage.delete('refreshToken');
      return false;
    }
  }
}