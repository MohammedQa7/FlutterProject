import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constance.dart';
import 'package:flutter_application_1/core/viewmodel/cart_view_model.dart';
import 'package:flutter_application_1/view/widget/customText.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: Get.put(CartViewModel()),
              builder: (controller) => Container(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Image.network(
                              controller.cartProductModel[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                  text: controller.cartProductModel[index].name,
                                  fontSize: 20,
                                ),
                                SizedBox(height: 10),
                                customText(
                                  text:
                                      '\$${controller.cartProductModel[index].price.toString()}',
                                  color: PrimaryColor,
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 140,
                                  color: Colors.grey.shade200,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        onTap: () {
                                          controller.increaseQuantity(index);
                                        },
                                      ),
                                      SizedBox(width: 20),
                                      customText(
                                        alignment: Alignment.center,
                                        text: controller
                                            .cartProductModel[index].quantity
                                            .toString(),
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: GestureDetector(
                                          child: Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                          onTap: () {
                                            controller.decreaseQuantity(index);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.cartProductModel.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    customText(
                      text: "Total",
                      color: Colors.grey,
                      fontSize: 22,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GetBuilder<CartViewModel>(
                      init: Get.find(),
                      builder: (controller) => customText(
                        text: "\$ ${controller.TotalPrice}",
                        color: PrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  child: FlatButton(
                      onPressed: () {},
                      color: PrimaryColor,
                      child: customText(
                        text: "checkout",
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
