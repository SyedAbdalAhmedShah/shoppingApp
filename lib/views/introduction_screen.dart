import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/introduction_provider.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
import 'package:flutter_application_1/utils/custom_gap.dart';
import 'package:flutter_application_1/utils/dimension.dart';
import 'package:flutter_application_1/utils/placeHolder_data.dart';
import 'package:flutter_application_1/utils/strings.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final introProvider = context.watch<IntroductionProvider>();
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: PageView.builder(
              controller: introProvider.pageController,
              itemCount: PlaceHolderData.introImagePlaceHolder.length,
              onPageChanged: introProvider.onPageChange,
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
                            fontSize: Dimensions.font20),
                      ),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: introProvider.pageNumber != 0 ? 1 : 0,
                    child: TextButton(
                        onPressed: introProvider.onPagePrev,
                        child: Text(
                          Strings.prev,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font18),
                        )),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          PlaceHolderData.introImagePlaceHolder.length,
                          (index) => AnimatedContainer(
                                margin: EdgeInsets.all(Dimensions.w0Point5),
                                height: Dimensions.h6,
                                width: introProvider.pageNumber == index
                                    ? Dimensions.w2
                                    : 14,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: introProvider.pageNumber == index
                                        ? AppColors.bluishColor
                                        : Colors.transparent,
                                    shape: BoxShape.circle),
                                duration: const Duration(milliseconds: 500),
                              )),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                introProvider.pageNumber == 2
                                    ? Colors.blue
                                    : Colors.transparent)),
                        onPressed: introProvider.onNextPage,
                        child: Text(
                          introProvider.pageNumber == 2
                              ? Strings.start
                              : Strings.next,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimensions.font18,
                              color: introProvider.pageNumber == 2
                                  ? Colors.white
                                  : Theme.of(context).primaryColor),
                        )),
                  )
                ]),
          ),
          const CustomGap()
        ],
      ),
    );
  }
}
