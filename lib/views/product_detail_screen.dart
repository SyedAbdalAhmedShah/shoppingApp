import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/utils/dimension.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetailScreen({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Item Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: Dimensions.h30,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
                color: Colors.amber,
                image: DecorationImage(
                    image: NetworkImage(productModel.image ?? ""),
                    fit: BoxFit.fill)),
          )
        ],
      ),
    );
  }
}
