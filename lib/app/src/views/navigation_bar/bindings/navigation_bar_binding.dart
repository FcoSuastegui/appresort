import 'package:appresort/app/src/views/navigation_bar/controller/navigation_bar_controller.dart';
import 'package:get/get.dart';

class NavigationBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationBarController.inst);
  }
}