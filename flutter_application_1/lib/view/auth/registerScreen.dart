// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/constance.dart';
import 'package:flutter_application_1/view/auth/LoginScreen.dart';
import 'package:flutter_application_1/view/widget/customText.dart';
import 'package:flutter_application_1/view/widget/custom_Text_Filed.dart';
import 'package:flutter_application_1/core/viewmodel/auth_view_model.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthviewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.to(LoginScreen());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      // ----------------------- Body
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                customText(
                  text: "SignUp",
                  fontSize: 30,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      customText(
                        text: "Name",
                        fontSize: 14,
                        color: Colors.grey.shade900,
                      ),
                      TextFormField(
                        // if there is an error here just replace the onSave() with     onSave: (value) {}
                        onSaved: (value) {
                          controller.name = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      customText(
                        text: "Email",
                        fontSize: 14,
                        color: Colors.grey.shade900,
                      ),
                      TextFormField(
                        // if there is an error here just replace the onSave() with     onSave: (value) {}
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "random@gmail.com",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      customText(
                        text: "Password",
                        fontSize: 14,
                        color: Colors.grey.shade900,
                      ),
                      TextFormField(
                        // if there is an error here just replace the onSave() with     onSave: (value) {}
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "*******",
                          hintStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                    color: PrimaryColor,
                    child: customText(
                      text: "SIGN UP",
                      alignment: Alignment.center,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
