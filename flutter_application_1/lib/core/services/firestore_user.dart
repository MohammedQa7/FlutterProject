import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/core/viewmodel/auth_view_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  // Future<DocumentSnapshot> getCurrentUser(String uid) async {
  //   return await _userCollectionRef.doc(uid).get();
  // }
}
