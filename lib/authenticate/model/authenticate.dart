import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate extends ChangeNotifier {
  String? _uid;
  String? _email;
  String? error;

  String? get uid => _uid;

  String? get email => _email;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUp(String email, String password) async {
    bool retVal = false;
    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (_userCredential.user != null) {
        retVal = true;
      }
    } catch (e) {
      error = e.toString();
      print(e);
    }
    return retVal;
  }

  Future<bool> logIn(String email, String password) async {
    bool retVal = false;
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_userCredential.user != null) {
        _uid = _userCredential.user!.uid;
        _email = _userCredential.user!.email;
        retVal = true;
      }
    } catch (e) {
      error = e.toString();
      print(e);
    }
    return retVal;
  }
}
