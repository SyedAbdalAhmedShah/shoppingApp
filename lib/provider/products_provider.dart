import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/products_repo.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = false;
  ProductRepo repo = ProductRepo();

  Future getAllProduct() async {
    isLoading = true;
    try {
      await repo.productsApi;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Error is $error');
      }
    }
  }
}
