import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomGap extends StatelessWidget {
  final double? height;
  final double? width;
  const CustomGap({this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? kBottomNavigationBarHeight,
      width: width,
    );
  }
}
