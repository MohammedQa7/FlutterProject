// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/constance.dart';
import 'package:flutter_application_1/view/auth/registerScreen.dart';
import 'package:flutter_application_1/view/widget/customText.dart';
import 'package:flutter_application_1/view/widget/custom_Text_Filed.dart';
import 'package:flutter_application_1/core/viewmodel/auth_view_model.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthviewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 10, left: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      text: "Welcome",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: customText(
                        text: "Sign Up",
                        fontSize: 18,
                        color: PrimaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                customText(
                  text: "Sign in to Continue",
                  fontSize: 14,
                  color: Colors.grey,
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
                customText(
                  text: "Forgot Password ?",
                  fontSize: 14,
                  alignment: Alignment.topRight,
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
                        controller.signInWithEmailAndPassword();
                      }
                    },
                    color: PrimaryColor,
                    child: customText(
                      text: "SIGN IN",
                      alignment: Alignment.center,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 20,
                ),
                customText(
                  text: "-OR-",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade300,
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset('assets/images/google.png'),
                          SizedBox(
                            width: 90,
                          ),
                          customText(
                            text: "Sign with Google!",
                          )
                        ],
                      ),
                    )),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 40,
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade300,
                    ),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset('assets/images/facebook.png'),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 90,
                          ),
                          customText(
                            text: "Sign with Facebook!",
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
