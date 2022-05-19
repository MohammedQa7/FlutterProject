import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Helper/category_model.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/viewmodel/home_view_model.dart';

class CategoryModel {
  late String name, image;

  CategoryModel({required this.name, required this.image});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
