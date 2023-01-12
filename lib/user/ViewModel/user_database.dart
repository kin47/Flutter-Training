import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_training/user/model/user.dart';

class UserDatabase{
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

  Future<bool> createUser(OurUser user) async {
    bool isSuccess=false;
    try{
      await _firebaseFirestore.collection("user").doc(user.uid).set({
        'name' : user.name,
        'email' : user.email,
        'accountCreated' : Timestamp.now(),
      });
      isSuccess=true;
    } catch(e) {
      print(e);
    }
    return isSuccess;
  }
}