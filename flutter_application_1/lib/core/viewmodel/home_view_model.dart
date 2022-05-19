import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Helper/category_model.dart';
import 'package:flutter_application_1/constance.dart';
import 'package:flutter_application_1/core/services/home_service.dart';
import 'package:flutter_application_1/core/viewmodel/control_view_model.dart';
import 'package:flutter_application_1/core/viewmodel/home_view_model.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/viewmodel/control_view_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  late List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;

  late List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {
    getCategory();
    getBestSellingProduct();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        // print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProduct() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        print(_productModel.length);
        _loading.value = false;
      }
      update();
    });
  }
}
