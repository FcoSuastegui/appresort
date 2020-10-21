import 'package:appresort/app/src/views/onboarding/components/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  OnBoardingController._internal();
  static OnBoardingController _instance = OnBoardingController._internal();
  static OnBoardingController get instance => _instance;

  int _numPages = 3;
  int get numbPages => _numPages;

  RxInt _currentPage = 0.obs;
  RxInt get currentPage => _currentPage;

  final PageController _pageViewController = PageController(initialPage: 0);
  PageController get pageViewController => _pageViewController;

  @override
  void onInit() {
    _currentPage.value = 0;
    super.onInit();
  }

  List<OnBoardingContent> onboarding = [
    OnBoardingContent(
      title: "Todas las comodidades",
      image: "assets/slides/slide_1.png",
      isTop: false,
    ),
    OnBoardingContent(
      title: "Que imaginas.",
      image: "assets/slides/slide_2.png",
      isTop: true,
    ),
    OnBoardingContent(
      title: "En un solo lugar.",
      image: "assets/slides/slide_3.png",
      isTop: true,
    )
  ];

  void onPageChanged(int page) => _currentPage.value = page;
  bool onPressed() {
    if (_pageViewController.page > 1) {
      return true;
    }
    _pageViewController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    return false;
  }
}
