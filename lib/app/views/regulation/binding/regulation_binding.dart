import 'package:appresort/app/views/regulation/controller/regulation_controller.dart';
import 'package:get/get.dart';

class RegulationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegulationController());
  }
}
