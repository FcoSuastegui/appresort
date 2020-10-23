import 'package:appresort/app/src/data/models/response_model.dart';
import 'package:appresort/app/src/data/services/helper_service.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:get/get.dart';

class ReglamentoController extends GetxController {
  ReglamentoController._internal();
  static ReglamentoController _instance = ReglamentoController._internal();
  static ReglamentoController get instance => _instance;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  RxString _url = ''.obs;
  String get url => _url.value;

  @override
  void onInit() {
    obtenerReglamento();
    super.onInit();
  }

  Future<void> obtenerReglamento() async {
    _loading(true);
    final ResponseModel respose = await HelperService.inst.reglamento(
      idpropietario: GetStorages.inst.idpropietario,
      sistema: GetStorages.inst.sistema,
    );
    _url.value = respose.data;
    _loading(false);
  }
}
