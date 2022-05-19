import 'package:flutter_application_1/Helper/local_storage_data.dart';
import 'package:flutter_application_1/core/viewmodel/auth_view_model.dart';
import 'package:flutter_application_1/core/viewmodel/cart_view_model.dart';
import 'package:flutter_application_1/core/viewmodel/control_view_model.dart';
import 'package:flutter_application_1/core/viewmodel/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthviewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}
