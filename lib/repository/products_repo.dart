import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/product_model.dart';

class ProductRepo {
  Dio dio = Dio();
  String productsApi = "https://fakestoreapi.com/products";
  List<ProductModel> allProducts = [];
  Future<List<ProductModel>> getAllProductFromServer() async {
    Response response = await dio.get(productsApi);

    print("response ${response.data}");

    for (var prod in response.data) {
      ProductModel productModel = ProductModel.fromJson(prod);
      allProducts.add(productModel);
    }

    return allProducts;
  }
}
