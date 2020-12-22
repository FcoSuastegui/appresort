import 'package:appresort/app/views/saldos/controller/saldo_controller.dart';
import 'package:get/get.dart';

class SaldoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaldoController.instance);
  }
}
