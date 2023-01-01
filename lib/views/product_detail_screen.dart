import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/utils/custom_gap.dart';
import 'package:flutter_application_1/utils/dimension.dart';
import 'package:flutter_application_1/widgets/Rating_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetailScreen({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.h35,
            width: double.infinity,
            margin: EdgeInsets.only(top: kToolbarHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
              image: DecorationImage(
                image: NetworkImage(productModel.image ?? ""),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              productModel.title ?? '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font16),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${productModel.price.toString()}",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.font18),
                ),
                CustomRatingWidget(rating: productModel.rating?.rate ?? 0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              productModel.description ?? '',
              textAlign: TextAlign.justify,
              style: TextStyle(letterSpacing: 1, fontSize: Dimensions.font16),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 6.h,
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: kBottomNavigationBarHeight),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                ),
                onPressed: () {},
                icon: Icon(Icons.shop_sharp),
                label: Text("BUY")),
          )
        ],
      ),
    );
  }
}
