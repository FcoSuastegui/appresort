import 'package:appresort/app/src/data/models/cargo_model.dart';
import 'package:appresort/app/src/data/services/saldo_service.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:get/get.dart';

class ListarCargosController extends GetxController {
  ListarCargosController._internal();
  static ListarCargosController _instance = ListarCargosController._internal();
  static ListarCargosController get instance => _instance;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  RxList<CargoModel> _cargos = List<CargoModel>().obs;
  RxList<CargoModel> get cargos => _cargos;

  CargoModel cargoSeleccionado;
  double get total => cargoSeleccionado.total;

  @override
  void onInit() {
    obtenerCargos();
    super.onInit();
  }

  Future<void> obtenerCargos() async {
    _loading(true);
    final response = await SaldoService.inst.obtenerCargos(
      GetStorages.inst.idpropietario,
    );
    _cargos.value = [];
    if (response.status) {
      response.data.forEach((item) => _cargos.add(CargoModel.fromJson(item)));
    }
    _loading(false);
  }
}
