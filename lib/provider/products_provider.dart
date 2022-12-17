import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/repository/products_repo.dart';
import 'package:provider/provider.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = false;
  ProductRepo repo = ProductRepo();
  List<ProductModel> allProd = [];

  List<ProductModel> get allProduct => allProd;
  Future getAllProduct() async {
    isLoading = true;

    print("isloading2 $isLoading");
    try {
      allProd = await repo.getAllProductFromServer();

      isLoading = false;
      print("isloading $isLoading");
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Error is $error');
      }
      return [];
    }
  }
}
