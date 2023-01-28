import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/utils/custom_gap.dart';
import 'package:flutter_application_1/utils/dimension.dart';
import 'package:flutter_application_1/widgets/Rating_widget.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../provider/products_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailScreen({required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductProvider? productProvider;
  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, data, child) {
      return ModalProgressHUD(
        inAsyncCall: data.isLoading,
        child: Scaffold(
          body: Builder(builder: (context) {
            return Column(
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
                      image: NetworkImage(widget.productModel.image ?? ""),
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
                    widget.productModel.title ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.productModel.price.toString()}",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: Dimensions.font18),
                      ),
                      CustomRatingWidget(rating: widget.productModel.rating?.rate ?? 0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.productModel.description ?? '',
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
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10), backgroundColor: Theme.of(context).colorScheme.primary),
                      onPressed: () async {
                        data.BuyProduct(context: context, ammount: widget.productModel.price!.toInt().toString());
                        // await displayPaymentSheet();
                      },
                      icon: Icon(Icons.shop_sharp),
                      label: Text(
                        "BUY",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            );
          }),
        ),
      );
    });
  }
}
