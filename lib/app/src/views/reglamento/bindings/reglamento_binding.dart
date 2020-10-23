
import 'package:get/get.dart';
import 'package:appresort/app/src/views/reglamento/controller/reglamento_controller.dart';

class ReglamentoBindig implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReglamentoController.instance);
  }
}