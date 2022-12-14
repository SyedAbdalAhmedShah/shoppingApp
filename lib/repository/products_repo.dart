import 'package:dio/dio.dart';

class ProductRepo {
  Dio dio = Dio();
  String productsApi = "https://fakestoreapi.com/products";
  getAllProductFromServer() async {
    Response response = await dio.get(productsApi);
  }
}
