import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<Map<String, String>> signUp(
      {required String email, required String password}) async {
    var data = {
      "error": "",
    };
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      data['uid'] = user.user!.uid;
    } on FirebaseAuthException catch (e) {
      data['error'] = e.message!;
    }
    return data;
  }

  Future<Map<String, String>> signIn(
      {required String email, required String password}) async {
    var data = {"error": ""};

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      data["error"] = e.message!;
    }
    return data;
  }
}
