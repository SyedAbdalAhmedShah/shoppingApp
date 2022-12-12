import 'package:flutter/material.dart';

class IntroductionProvider with ChangeNotifier {
  int pageNumber = 0;
  PageController pageController = PageController(initialPage: 0);

  onPageChange(int pageIndex) {
    debugPrint("page number $pageIndex");
    pageNumber = pageIndex;
    notifyListeners();
  }

  onNextPage() {
    if (pageNumber < 2) {
      pageNumber++;
      pageController.animateToPage(pageNumber,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInSine);
      notifyListeners();
    }
  }

  onPagePrev() {
    if (pageNumber > 0) {
      pageNumber--;
      pageController.animateToPage(pageNumber,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInSine);
      notifyListeners();
    }
  }
}
