import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/assets.dart';
import 'package:flutter_application_1/utils/custom_gap.dart';
import 'package:flutter_application_1/utils/dimension.dart';
import 'package:flutter_application_1/utils/strings.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
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
                Image(
                  image: const AssetImage(Assets.intro1),
                  fit: BoxFit.cover,
                  height: Dimensions.h10,
                  width: Dimensions.w15,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: Dimensions.font16, color: Colors.grey),
                  ),
                  CustomGap(
                    height: Dimensions.h1,
                  ),
                  Text(
                    'title',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(fontSize: Dimensions.font16),
                  ),
                  CustomGap(
                    height: Dimensions.h1,
                  ),
                  Text('Price ', style: Theme.of(context).textTheme.titleSmall),
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
                          initialRating: 3.5,
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
            )
          ],
        ),
      ),
    );
  }
}
