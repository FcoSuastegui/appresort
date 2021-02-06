import 'package:appresort/app/views/onboarding/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
