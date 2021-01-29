import 'package:get/get.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/controller/firebase_controller.dart';

class AppController extends GetxController {
  AppController._internal();
  static AppController _instance = AppController._internal();
  static AppController get inst => _instance;

  String _inicialRoute = GetStorages.i.validarToken();
  String get inicialRoute => _inicialRoute;

  @override
  void onInit() async {
    if (inicialRoute != '/') await FireBaseController.inst.init();
    super.onInit();
  }
}
