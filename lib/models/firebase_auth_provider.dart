import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthProvider {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  String? getEmail() {
    return _firebaseAuth.currentUser?.email;
  }

  String? getUsername() {
    return _firebaseAuth.currentUser?.displayName;
  }

  String getInitials() {
    String? username = _firebaseAuth.currentUser?.displayName;
    if (username == null) return "ERROR";
    List result = username.split(" ");

    return result[0][0] + result[1][0];
  }

  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    try {
      return _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } catch (err) {
      throw err;
    }
  }
}
