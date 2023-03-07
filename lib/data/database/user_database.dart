import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_training/modules/user/model/our_user.dart';

class UserDatabase {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> createUser(OurUser user) async {
    bool isSuccess = false;
    try {
      await _firebaseFirestore.collection("user").doc(user.uid).set({
        'name': user.name,
        'email': user.email,
        'accountCreated': Timestamp.now(),
      });
      isSuccess = true;
    } catch (e) {
      print(e);
    }
    return isSuccess;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal = OurUser();
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await _firebaseFirestore.collection("user").doc(uid).get();
      retVal.uid = uid;
      retVal.email = documentSnapshot['email'];
      retVal.name = documentSnapshot['name'];
      retVal.accountCreated = documentSnapshot['accountCreated'];
      retVal.language=documentSnapshot['language'];
    } catch (e) {
      print("Loi khong lay duoc in4 user trong database: $e");
    }
    return retVal;
  }

  Future<bool> changeName(String uid, String language) async {
    bool isSuccess = false;
    try{
      await _firebaseFirestore.collection("user").doc(uid).update({
        'name' : language,
      });
      isSuccess=true;
    } catch(e) {
      print("Khong the doi ten: $e");
    }
    return isSuccess;
  }

  void changeLanguage(String uid, String newName) async {
    try{
      await _firebaseFirestore.collection("user").doc(uid).update({
        'language' : newName,
      });
    } catch(e) {
      print("Khong the doi ngon ngu: $e");
    }
  }

  Future<bool> deleteAccount(String uid) async {
    bool isSuccess=false;
    try{
      await _firebaseFirestore.collection("user").doc(uid).delete();
      isSuccess=true;
    } catch(e) {
      print("Cannot delete account from Firebase Firestore: $e");
    }
    return isSuccess;
  }
}
