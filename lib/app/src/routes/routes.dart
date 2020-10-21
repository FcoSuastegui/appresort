import 'package:appresort/app/src/views/login/login_view.dart';
import 'package:appresort/app/src/views/navigation_bar/bindings/navigation_bar_binding.dart';
import 'package:appresort/app/src/views/navigation_bar/navigation_bar_view.dart';
import 'package:appresort/app/src/views/onboarding/bindings/onboarding_binding.dart';
import 'package:appresort/app/src/views/onboarding/onboarding_view.dart';
import 'package:get/get.dart';

class Routes {
  Routes._internal();
  static Routes _instance = Routes._internal();
  static Routes get inst => _instance;

  final List<GetPage> routes = [
    GetPage(
      name: LoginView.routeName,
      page: () => LoginView(),
    ),
    GetPage(
      name: OnBoardingView.routeName,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: NavigationBarView.routeName,
      page: () => NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
  ];
}
