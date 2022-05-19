import 'package:flutter_application_1/constance.dart';
import 'package:flutter_application_1/core/viewmodel/control_view_model.dart';
import 'package:flutter_application_1/core/viewmodel/home_view_model.dart';
import 'package:flutter_application_1/view/detalisScreen.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/view/auth/LoginScreen.dart';
import 'package:flutter_application_1/view/widget/customText.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_application_1/core/viewmodel/control_view_model.dart';
import 'package:flutter_application_1/model/product_model.dart';

class HomeScreen extends GetWidget<HomeViewModel> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      customText(
                        text: "Categories",
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GetBuilder<HomeViewModel>(
                        builder: (controller) => Container(
                          height: 100,
                          child: ListView.separated(
                            itemCount: controller.categoryModel.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.grey.shade100,
                                    ),
                                    height: 60,
                                    width: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(controller
                                          .categoryModel[index].image),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  customText(
                                    text: controller.categoryModel[index].name,
                                  )
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          customText(
                            text: "See All",
                            fontSize: 16,
                          )
                        ],
                      ),

                      // Product Container
                      SizedBox(
                        height: 15,
                      ),
                      GetBuilder<HomeViewModel>(
                        builder: (controller) => Container(
                          height: 350,
                          child: ListView.separated(
                            itemCount: controller.productModel.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(DetailsScreen(
                                      model: controller.productModel[index]));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .4,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.grey.shade100,
                                        ),
                                        child: Container(
                                            height: 220,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
                                            child: Image.network(
                                              controller
                                                  .productModel[index].image,
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      customText(
                                        text:
                                            controller.productModel[index].name,
                                        alignment: Alignment.bottomLeft,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      customText(
                                        text: "BeoPlay Speakcer",
                                        color: Colors.grey,
                                        alignment: Alignment.bottomLeft,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      customText(
                                        text: controller
                                                .productModel[index].price
                                                .toString() +
                                            '\$',
                                        color: PrimaryColor,
                                        alignment: Alignment.bottomLeft,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
