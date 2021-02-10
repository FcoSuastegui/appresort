import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController._internal();
  static HomeController _instance = HomeController._internal();
  static HomeController get i => _instance;

  RxString _total = '8,459.00'.obs;
  String get total => _total.value;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getCharge() async {
    _loading(true);
    await Future.delayed(const Duration(seconds: 2));
    _total("8,200.00");
    _loading(false);
  }
}
