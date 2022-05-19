import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Helper/category_model.dart';
import 'package:flutter_application_1/Helper/extension.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/viewmodel/home_view_model.dart';

class ProductModel {
  late String productid, name, image, description, sized, price;
  late Color color;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.color,
      required this.sized,
      required this.price,
      required this.productid});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    productid = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'productid': productid,
    };
  }
}
