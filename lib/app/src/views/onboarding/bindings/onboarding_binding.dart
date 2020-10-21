import 'package:appresort/app/src/views/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController.instance);
  }
}