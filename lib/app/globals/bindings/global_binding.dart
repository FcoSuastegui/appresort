import 'package:appresort/app/globals/controller/scroll_bar_controller.dart';
import 'package:appresort/app/views/nav_bar/controller/nav_bar_controller.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:get/get.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScrollBarController.i, fenix: true);
    Get.lazyPut(() => NavBarController.i, fenix: true);
    Get.lazyPut(() => NotificationController.i, fenix: true);
  }
}
