import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_training/user/model/our_user.dart';

class UserDatabase{
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  String? getName;
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

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retVal=OurUser();
    DocumentSnapshot documentSnapshot;
    try{
      documentSnapshot=await _firebaseFirestore.collection("user").doc(uid).get();
      retVal.uid=uid;
      retVal.email=documentSnapshot['email'];
      retVal.name=documentSnapshot['name'];
    } catch(e) {
      print(e);
    }
    return retVal;
  }

  Future<bool> borrowedBooks(String userId, String bookId) async {
    bool isSuccess=false;
    List<String> books=[];
    try{
      books.add(bookId);
      await _firebaseFirestore.collection("user").doc(userId).update({
        'borrowedBooks' : FieldValue.arrayUnion(books),
      });
      isSuccess=true;
    }catch(e) {
      print(e);
    }
    return isSuccess;
  }
}