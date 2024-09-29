import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_tut/models/app_user.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sign up a new user
  static Future<AppUser?> signUp(String email, String password) async {
    try {
      final UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = credential.user;

      if (user != null) {
        return AppUser(uid: user.uid, email: user.email!);
      }

      return null;
    } catch (e) {
      return null;
    }

    // try {
    //   final UserCredential credential = await _firebaseAuth
    //       .createUserWithEmailAndPassword(email: email, password: password);
    //   final User? user = credential.user;
    //   return AppUser(uid: user!.uid, email: user.email!);
    // } on FirebaseAuthException catch (e) {
    //   print('Failed to sign up: ${e.message}');
    //   return null;
    // }
  }

  // log user out
  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
