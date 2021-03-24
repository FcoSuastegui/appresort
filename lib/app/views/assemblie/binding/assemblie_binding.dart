import 'package:appresort/app/views/assemblie/controller/assemblie_controller.dart';
import 'package:get/get.dart';

class AssemblieBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssemblieController());
  }
}
