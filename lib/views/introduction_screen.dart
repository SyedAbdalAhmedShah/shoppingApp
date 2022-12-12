import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/assets.dart';
import 'package:flutter_application_1/utils/placeHolder_data.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: PlaceHolderData.introImagePlaceHolder.length,
              itemBuilder: ((context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage(
                              PlaceHolderData.introImagePlaceHolder[index])),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
