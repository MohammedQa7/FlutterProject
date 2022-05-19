import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Helper/local_storage_data.dart';
import 'package:flutter_application_1/core/services/firestore_user.dart';
import 'package:flutter_application_1/core/viewmodel/control_view_model.dart';
import 'package:flutter_application_1/core/viewmodel/home_view_model.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/view/controller_view.dart';
import 'package:flutter_application_1/view/homescreen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/view/auth/LoginScreen.dart';

class AuthviewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name;
  final _user = Rxn<User>();
  String? get user => _user.value?.email;

  // final LocalStorageData localStorageData = Get.find();
  @override

  // 2wl ma bnade 3la al controller bnf4 al gwa al init
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

//  lma al widget yn3mllha create
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

// lma 26l3 mn al widget
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

// Create Account

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async => {
                await FireStoreUser().addUserToFirestore(
                    UserModel(userId: user.user!.uid, email: email, name: name))
              });

      Get.offAll(HomeScreen());
    } catch (error) {
      print(error);
      Get.snackbar("Error Login Account", error.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  // void saveUser(UserCredential user) async {
  //   UserModel userModel =
  //       UserModel(userId: user.user!.uid, email: email, name: name);
  //   await FireStoreUser().addUserToFirestore(userModel);
  //   setUser(userModel);
  // }

// Log in to your Account
  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // .then((value) async => {
      //       await FireStoreUser().getCurrentUser(value.user!.uid).then(
      //           (value) => {
      //                 setUser(UserModel.fromJson(
      //                     value.data() as Map<dynamic, dynamic>))
      //               })
      //     });
      Get.offAll(HomeScreen());
    } catch (error) {
      print(error);
      Get.snackbar("Error Login Account", error.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  // void setUser(UserModel userModel) async {
  //   await localStorageData.setUser(userModel);
  // }

}
