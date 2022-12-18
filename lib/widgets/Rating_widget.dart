import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/dimension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingWidget extends StatelessWidget {
  final double rating;
  const CustomRatingWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        ignoreGestures: true,
        itemSize: Dimensions.h2,
        allowHalfRating: true,
        itemCount: 5,
        maxRating: 5,
        glow: true,
        initialRating: rating,
        glowColor: Theme.of(context).colorScheme.primary,
        itemBuilder: ((context, index) => Icon(
              Icons.star,
              color: Theme.of(context).colorScheme.primary,
            )),
        onRatingUpdate: ((rating) => debugPrint('Rating is $rating')));
  }
}
