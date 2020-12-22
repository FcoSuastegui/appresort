import 'package:appresort/app/data/models/saldos_model.dart';
import 'package:appresort/app/data/services/saldo_service.dart';
import 'package:appresort/app/helpers/get_storage.dart';
import 'package:get/get.dart';

class SaldoController extends GetxController {
  SaldoController._internal();
  static SaldoController _instance = SaldoController._internal();
  static SaldoController get instance => _instance;

  SaldosModel _saldo;
  SaldosModel get saldo => _saldo;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  @override
  void onInit() {
    obtenerSaldo();
    super.onInit();
  }

  Future<void> obtenerSaldo() async {
    _loading(true);
    final response = await SaldoService.inst.obtenerSaldo(GetStorages.inst.idpropietario);
    if (response.status) {
      _saldo = SaldosModel.fromJson(response.data);
    }
    _loading(false);
  }

  Future<String> estadoCuenta() async {
    String file = '';
    final response = await SaldoService.inst.estadoCuenta(
      idpropietario: GetStorages.inst.idpropietario,
      sistema: GetStorages.inst.sistema,
    );
    if (response.status) {
      file = response.data;
    }
    return file;
  }
}
