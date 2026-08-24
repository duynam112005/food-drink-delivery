import 'package:food_drink_delivery/services/auth_service.dart';
import 'package:food_drink_delivery/storage/secure_storage_provider.dart';
import 'package:food_drink_delivery/models/enums/load_status.dart';
import 'package:food_drink_delivery/repositories/auth/auth_repository_provider.dart';
import 'package:food_drink_delivery/ui/pages/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return const LoginState();
  }

  Future<void> onLoginWithGoogle() async {
    try {
      final AuthService authService = AuthService();
      final authRepository = ref.read(authRepositoryProvider);
      final storage = ref.read(secureStorageProvider);

      final firebaseIdToken = await authService.signInWithGoogle();
      if (firebaseIdToken == null) {
        throw Exception('You have not signed in with Google');
      }
      state = state.copyWith(socialLoginStatus: LoadStatus.loading);
      final result = await authRepository.loginWithSocial(firebaseIdToken);

      final accessToken = result.accessToken;
      final refreshToken = result.refreshToken;

      Future.wait([
        storage.write('accessToken', accessToken!),
        storage.write('refreshToken', refreshToken!),
      ]);

      state = state.copyWith(socialLoginStatus: LoadStatus.success);
    } catch (e) {
      state = state.copyWith(
        socialLoginStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> onLoginEmailAndPassword(String email, String password) async {
    state = state.copyWith(loadStatus: LoadStatus.loading);
    try {
      final authRepository = ref.read(authRepositoryProvider);
      final storage = ref.read(secureStorageProvider);
      final result = await authRepository.loginWithEmailAndPassword(
        email,
        password,
      );
      final accessToken = result.accessToken;
      final refreshToken = result.refreshToken;

      Future.wait([
        storage.write('accessToken', accessToken!),
        storage.write('refreshToken', refreshToken!),
      ]);

      state = state.copyWith(loadStatus: LoadStatus.success);
    } catch (e) {
      state = state.copyWith(
        loadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }
}
