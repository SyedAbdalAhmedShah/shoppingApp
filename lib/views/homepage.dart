import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/strings.dart';
import 'package:flutter_application_1/widgets/product_item_widget.dart';
import 'package:animations/animations.dart';

import 'cart_screen.dart';
import 'product_detail_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Strings.ourProduct,
                style: Theme.of(context).textTheme.headline1),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (
                context,
                index,
              ) =>
                      OpenContainer(
                          transitionDuration: const Duration(seconds: 2),
                          closedBuilder: ((context, action) =>
                              const ProductItem()),
                          openBuilder: ((context, action) =>
                              const ProductDetailScreen()))),
            )
          ],
        ),
      ),
    );
  }
}
