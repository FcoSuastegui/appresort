import 'package:appresort/app/views/balance/pages/pago_linea/controller/pago_linea_controller.dart';
import 'package:get/get.dart';

class PagoLineaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PagoLineaController());
  }
}
