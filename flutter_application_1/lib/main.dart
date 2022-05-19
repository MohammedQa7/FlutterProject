import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Helper/binding.dart';
import 'package:flutter_application_1/view/auth/LoginScreen.dart';
import 'package:flutter_application_1/view/controller_view.dart';
import 'package:get/get.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControllerView(),
      ),
      theme: ThemeData(fontFamily: 'SourceSans'),
    );
  }
}
