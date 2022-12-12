import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
import 'package:flutter_application_1/utils/assets.dart';
import 'package:flutter_application_1/utils/dimension.dart';
import 'package:flutter_application_1/utils/placeHolder_data.dart';
import 'package:flutter_application_1/utils/strings.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: PageView.builder(
              itemCount: PlaceHolderData.introImagePlaceHolder.length,
              itemBuilder: ((context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage(
                              PlaceHolderData.introImagePlaceHolder[index])),
                      Text(
                        PlaceHolderData.introTextPlaceHolder[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font18),
                      ),
                    ],
                  )),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Spacer(),
            Row(
              children: List.generate(
                  PlaceHolderData.introImagePlaceHolder.length,
                  (index) => AnimatedContainer(
                        margin: EdgeInsets.all(Dimensions.w2),
                        height: Dimensions.h6,
                        width: 14,
                        decoration: const BoxDecoration(
                            color: AppColors.bluishColor,
                            shape: BoxShape.circle),
                        duration: const Duration(milliseconds: 500),
                      )),
            ),
            Spacer(),
            TextButton(onPressed: () {}, child: const Text(Strings.next))
          ]),
          Spacer(),
        ],
      ),
    );
  }
}
