import 'package:flutter_application_1/core/viewmodel/cart_view_model.dart';
import 'package:flutter_application_1/core/services/database/cart_database_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Helper/category_model.dart';
import 'package:flutter_application_1/Helper/extension.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/viewmodel/home_view_model.dart';
import 'package:flutter_application_1/Helper/binding.dart';

class CartProductModel {
  late String name, image, price, productid;
  late int quantity;

  CartProductModel({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.productid,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productid = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productid,
    };
  }
}
