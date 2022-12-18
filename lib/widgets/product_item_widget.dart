import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/utils/assets.dart';
import 'package:flutter_application_1/utils/custom_gap.dart';
import 'package:flutter_application_1/utils/dimension.dart';
import 'package:flutter_application_1/utils/strings.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    print(product.image);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.brown.shade100,
              child: Stack(children: [
                SizedBox(
                  height: 15.h,
                  width: 25.w,
                  child: Image(
                    image: NetworkImage(product.image ?? '', scale: 2),
                    loadingBuilder: ((context, child, loadingProgress) =>
                        child),
                    errorBuilder: ((context, error, stackTrace) =>
                        Text('No Image')),
                    fit: BoxFit.fill,
                    height: Dimensions.h10,
                    width: Dimensions.w15,
                  ),
                ),
                const Positioned(
                    right: 5,
                    top: 5,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ))
              ]),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.category!.index.toString(),
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontSize: Dimensions.font16, color: Colors.grey),
                    ),
                    CustomGap(
                      height: Dimensions.h1,
                    ),
                    Container(
                      height: Dimensions.font16,
                      width: 400,
                      child: Text(
                        product.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontSize: Dimensions.font16,
                            overflow: TextOverflow.clip),
                      ),
                    ),
                    CustomGap(
                      height: Dimensions.h1,
                    ),
                    Text(product.price.toString(),
                        style: Theme.of(context).textTheme.titleSmall),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: Dimensions.h2,
                            allowHalfRating: true,
                            itemCount: 5,
                            maxRating: 5,
                            glow: true,
                            initialRating: product.rating?.rate ?? 0,
                            glowColor: Colors.yellow,
                            itemBuilder: ((context, index) => Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade600,
                                )),
                            onRatingUpdate: ((rating) =>
                                debugPrint('Rating is $rating'))),
                        CustomGap(
                          width: Dimensions.w2,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text(Strings.addToCart))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
