import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/viewmodel/auth_view_model.dart';
import 'package:flutter_application_1/core/viewmodel/control_view_model.dart';
import 'package:flutter_application_1/core/viewmodel/home_view_model.dart';
import 'package:flutter_application_1/view/ProfileScreen.dart';
import 'package:flutter_application_1/view/auth/LoginScreen.dart';
import 'package:flutter_application_1/view/cartScreen.dart';
import 'package:flutter_application_1/view/homescreen.dart';
import 'package:get/get.dart';

class ControllerView extends GetWidget<AuthviewModel> {
  ControlViewModel ctrlvwmdl = ControlViewModel();
  @override
  Widget build(BuildContext context) {
    return Obx((() {
      return (Get.find<AuthviewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    }));
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text("Explore"),
            ),
            label: '',
            icon: Image.asset(
              "assets/images/Icon_Explore.png",
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text("Cart"),
            ),
            label: '',
            icon: Image.asset(
              "assets/images/Icon_Cart.png",
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text("Profile"),
            ),
            label: '',
            icon: Image.asset(
              "assets/images/Icon_User.png",
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
