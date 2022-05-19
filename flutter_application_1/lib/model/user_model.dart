import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String userId, email, name;
  UserModel({
    required this.userId,
    required this.email,
    required this.name,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    ;
  }

  toJson() {
    return {
      userId: ['userId'],
      name: ['name'],
      email: ['email'],
    };
  }
}
