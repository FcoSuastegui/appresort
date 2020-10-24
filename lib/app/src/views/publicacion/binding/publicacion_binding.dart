import 'package:appresort/app/src/views/publicacion/controller/publicacion_controller.dart';
import 'package:get/get.dart';

class PublicacionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Publicacioncontroller.instance);
  }
}
