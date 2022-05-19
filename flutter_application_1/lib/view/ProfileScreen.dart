// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/core/viewmodel/profile_view_model.dart';
import 'package:flutter_application_1/view/auth/LoginScreen.dart';
import 'package:flutter_application_1/view/widget/customText.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        // ignore: deprecated_member_use
        body: Container(
          padding: EdgeInsets.only(top: 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Avatar.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Column(
                        children: [
                          customText(
                            text: "omar",
                            color: Colors.black,
                            fontSize: 32,
                          ),
                          customText(
                            text: "omar22@gmail.com",
                            color: Colors.black,
                            fontSize: 24,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: customText(
                        text: "Edit Profile",
                      ),
                      leading:
                          Image.asset('assets/images/Icon_Edit-Profile.png'),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: customText(
                        text: "Shipping Address",
                      ),
                      leading: Image.asset('assets/images/Icon_Location.png'),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: customText(
                        text: "Order History",
                      ),
                      leading: Image.asset('assets/images/Icon_History.png'),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: customText(
                        text: "Cards",
                      ),
                      leading: Image.asset('assets/images/Icon_Payment.png'),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {},
                    child: ListTile(
                      title: customText(
                        text: "Notification",
                      ),
                      leading: Image.asset('assets/images/Icon_Alert.png'),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: FlatButton(
                    onPressed: () {
                      controller.signOut();
                      Get.offAll(LoginScreen());
                    },
                    child: ListTile(
                      title: customText(
                        text: "Log Out",
                      ),
                      leading: Image.asset('assets/images/Icon_Exit.png'),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
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
