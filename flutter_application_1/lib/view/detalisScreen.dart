import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constance.dart';
import 'package:flutter_application_1/core/viewmodel/cart_view_model.dart';
import 'package:flutter_application_1/model/cart_product_model.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/view/widget/customText.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/services/database/cart_database_helper.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel model;
  DetailsScreen({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .55,
              height: 250,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      customText(
                        text: model.name,
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                customText(
                                  text: 'Size',
                                ),
                                customText(
                                  text: model.sized,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                customText(
                                  text: 'Color',
                                ),
                                Container(
                                  width: 40,
                                  height: 20,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20),
                                    color: model.color,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      customText(
                        text: 'Details',
                        fontSize: 26,
                      ),
                      SizedBox(height: 18),
                      customText(
                        text: model.description,
                        fontSize: 18,
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      customText(
                        text: "PRICE",
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                      customText(
                        text: '\$' + model.price,
                        color: PrimaryColor,
                        fontSize: 20,
                      )
                    ],
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (controller) => Container(
                      width: 180,
                      padding: EdgeInsets.all(20),
                      height: 100,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            controller.addProduct(CartProductModel(
                                productid: model.productid,
                                name: model.name,
                                image: model.image,
                                quantity: 1,
                                price: model.price));
                          },
                          color: PrimaryColor,
                          child: customText(
                            text: "Add",
                            alignment: Alignment.center,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
