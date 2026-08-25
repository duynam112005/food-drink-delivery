import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //sign in with google
  Future<String?> signInWithGoogle() async {
    try {
      await googleSignIn.initialize();

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      final googleAuth =googleUser.authentication;

      //print('Google ID Token: ${googleAuth.idToken}');

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, //còn cái này do google cấp, để Firebase xác thực xem có phải google cấp hay không
      );

      await _auth.signInWithCredential(credential);
      //print("googleCredential $googleCredential");

      // //nếu muốn mỗi lần đăng nhập đều lấy token mới thì có thể gọi getIdToken(true) để lấy token mới
      // //Còn không mặc định nó vẫn trả về token cũ nếu chưa hết hạn
      // và cái này để truyền lên server
      final token = await _auth.currentUser!.getIdToken();
      //print('Firebase ID Token: $token');

      return token;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      rethrow;
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: ${e.message}');
      rethrow;
    }
  }

  void signOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }
}
