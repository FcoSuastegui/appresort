import 'package:appresort/app/data/models/balance_total_model.dart';
import 'package:appresort/app/data/services/balance_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<BalanceTotalModels> _totales = BalanceTotalModels(
    total: 0.00,
    fondo: 0.00,
  ).obs;
  BalanceTotalModels get totales => _totales.value;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  @override
  void onInit() {
    getCharge();
    super.onInit();
  }

  Future<void> getCharge() async {
    _loading(true);
    final totales = await BalanceService.total(
      int.parse(GetStorages.i.user.idpropietario),
    );
    _totales.update((v) {
      v.total = totales.total;
      v.fondo = totales.fondo;
    });

    _loading(false);
  }

  Future<void> refresh() async {
    getCharge();
    NotificationController.i.refresh();
  }
}
