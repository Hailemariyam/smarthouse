// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // final String fullName;
  final String emailadress;
  final String password;
  final String userUid;
  bool isAdmin;
  // bool isAtheleticsCoach;
  // bool isFitnessCoach;
  // bool isAthelet;

  UserModel({
    // required this.fullName,
    required this.emailadress,
    required this.password,
    required this.userUid,
    required this.isAdmin,
    // required this.isAtheleticsCoach,
    // required this.isFitnessCoach,
    // required this.isAthelet
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      // fullName: doc['fullname'],
      emailadress: doc['email'],
      password: doc['password'],
      userUid: doc['userUid'],
      isAdmin: false,
      // isAtheleticsCoach: true,
      // isFitnessCoach: true,
      // isAthelet: true,
    );
  }

  static Future<UserModel> getUserData(String uid) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return UserModel.fromDocument(doc);
  }
}
