import 'package:flutter_application_1/core/services/database/cart_database_helper.dart';
import 'package:flutter_application_1/model/cart_product_model.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Helper/binding.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> get cartProductModel => _cartProductModel;
  List<CartProductModel> _cartProductModel = [];

  double get TotalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;
  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    getTotalPrice();
    _loading.value = false;
    update();
  }

  getTotalPrice() {
    for (var i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productid == cartProductModel.productid) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);

    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }
}
