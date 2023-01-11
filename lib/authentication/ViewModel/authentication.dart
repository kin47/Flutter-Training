import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_training/core/model/user.dart';
import 'package:flutter_training/core/services/database.dart';

class Authentication extends ChangeNotifier {
  OurUser _currentUser=OurUser();
  OurUser? get currentUser => _currentUser;

  String? _error;
  String? get error => _error;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> onStartUp() async {
    bool isSuccess = false;
    try {
      User firebaseUser = _auth.currentUser!;
      _currentUser.uid = firebaseUser.uid;
      _currentUser.email = firebaseUser.email;
      isSuccess = true;
    } catch (e) {
      print(e);
    }
    return isSuccess;
  }

  Future<bool> signUp(String email, String password, String name) async {
    OurUser newUser=OurUser();
    bool retVal = false;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      newUser.uid=userCredential.user!.uid;
      newUser.email=userCredential.user!.email;
      newUser.name=name;
      bool createSuccess=await OurDatabase().createUser(newUser);
      if (userCredential.user != null && createSuccess) {
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
        _currentUser.uid = userCredential.user!.uid;
        _currentUser.uid = userCredential.user!.email;
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
      _currentUser=OurUser();
      isSuccess = true;
    } catch (e) {
      print(e);
    }
    return isSuccess;
  }
}
