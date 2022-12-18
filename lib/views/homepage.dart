import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/provider/products_provider.dart';
import 'package:flutter_application_1/utils/strings.dart';
import 'package:flutter_application_1/widgets/product_item_widget.dart';
import 'package:animations/animations.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';
import 'product_detail_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ProductProvider? productProvider;
  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider!.getAllProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allProducts = context.watch<ProductProvider>().allProd;
    // productProvider!.getAllProduct();
    // final productProvider =
    //     Provider.of<ProductProvider>(context, listen: false);
    // productProvider.getAllProduct();

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text(
            Strings.shoppingCenter,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: OpenContainer(
                  transitionDuration: const Duration(seconds: 2),
                  openElevation: 0,
                  closedColor: Colors.transparent,
                  closedElevation: 0,
                  closedBuilder: ((context, action) => const SizedBox(
                        child: Icon(Icons.shopping_cart),
                      )),
                  openBuilder: ((context, action) => const CartScreen())),
            ),
          ],
        ),
        body: Visibility(
          visible: productProvider!.isLoading,
          child: Center(
            child: CircularProgressIndicator(),
          ),
          replacement: ProductsView(
            products: allProducts,
          ),
        ));
  }
}

class ProductsView extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsView({required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.ourProduct,
              style: Theme.of(context).textTheme.headline1),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (
                context,
                index,
              ) =>
                  OpenContainer(
                      middleColor: Colors.teal,
                      useRootNavigator: true,
                      transitionDuration: const Duration(seconds: 2),
                      closedBuilder: ((context, action) => ProductItem(
                            product: products[index],
                          )),
                      openBuilder: ((context, action) => ProductDetailScreen(
                            productModel: products[index],
                          ))),
            ),
          )
        ],
      ),
    );
  }
}
