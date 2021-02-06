import 'package:appresort/app/views/balance/controller/balance_controller.dart';
import 'package:get/get.dart';

class BalanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BalanceController());
  }
}
