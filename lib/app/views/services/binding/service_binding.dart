import 'package:appresort/app/views/services/controller/service_controller.dart';
import 'package:get/get.dart';

class ServiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceController());
  }
}
