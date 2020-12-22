import 'package:appresort/app/views/listar-cargos/controller/listar_cargos_controller.dart';
import 'package:get/get.dart';

class ListarCargosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListarCargosController.instance);
  }
}
