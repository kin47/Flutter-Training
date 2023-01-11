import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_training/core/model/user.dart';

class Authenticate extends ChangeNotifier {
  OurUser _user=OurUser();
  String? _error;

  OurUser? get user => _user;
  String? get error => _error;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> onStartUp() async {
    bool isSuccess = false;
    try {
      User firebaseUser = _auth.currentUser!;
      _user.uid = firebaseUser.uid;
      _user.email = firebaseUser.email;
      isSuccess = true;
    } catch (e) {
      print(e);
    }
    return isSuccess;
  }

  Future<bool> signUp(String email, String password) async {
    bool retVal = false;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        retVal = true;
      }
    } catch (e) {
      _error = e.toString();
      print(e);
    }
    return retVal;
  }

  Future<bool> logIn(String email, String password) async {
    bool retVal = false;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        _user.uid = userCredential.user!.uid;
        _user.uid = userCredential.user!.email;
        retVal = true;
      }
    } catch (e) {
      _error = e.toString();
      print(e);
    }
    return retVal;
  }

  Future<bool> logOut() async {
    bool isSuccess = false;
    try {
      await _auth.signOut();
      _user=OurUser();
      isSuccess = true;
    } catch (e) {
      print(e);
    }
    return isSuccess;
  }
}
