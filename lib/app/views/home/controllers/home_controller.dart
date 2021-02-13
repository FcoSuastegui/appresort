import 'package:appresort/app/data/services/balance_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/views/notification/controller/notification_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController._internal();
  static HomeController _instance = HomeController._internal();
  static HomeController get i => _instance;

  RxDouble _total = 0.0.obs;
  double get total => _total.value;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  @override
  void onInit() {
    getCharge();
    super.onInit();
  }

  Future<void> getCharge() async {
    _loading(true);
    final total = await BalanceService.total(int.parse(GetStorages.i.user.idpropietario));
    _total(total);
    _loading(false);
  }

  Future<void> refresh() async {
    getCharge();
    NotificationController.i.refresh();
  }
}
