import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String? uid;
  String? name;
  String? email;
  Timestamp? accountCreated;
  String language;

  OurUser({
    this.email,
    this.name,
    this.uid,
    this.accountCreated,
    this.language='en',
  });
}
