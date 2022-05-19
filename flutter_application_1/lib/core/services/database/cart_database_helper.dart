import 'package:flutter_application_1/constance.dart';
import 'package:flutter_application_1/model/cart_product_model.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/viewmodel/cart_view_model.dart';
import 'package:flutter_application_1/core/services/database/cart_database_helper.dart';
import 'package:flutter_application_1/Helper/binding.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;
  Future<Database> get database async => _database ??= await initDb();

  initDb() async {
    // bn7dd al path 2le bdo y5zn 3na 3la al ghza
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
  CREATE TABLE $tableCartProduct(
    $columnName TEXT NOT NULL,
    $columnImage TEXT NOT NULL,
    $columnQuantity INTEGER NOT NULL,
    $columnPrice TEXT NOT NULL,
    $columnProductid TEXT NOT NULL)

 ''');
    });
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];

    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;

    await dbClient.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient.update(tableCartProduct, model.toJson(),
        where: '$columnProductid =?', whereArgs: [model.productid]);
  }
}
