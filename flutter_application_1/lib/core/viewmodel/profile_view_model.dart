import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Helper/local_storage_data.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  final LocalStorageData localStorageData = Get.find();
  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    localStorageData.DeleteUser();
  }
}
