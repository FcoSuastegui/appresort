import 'package:appresort/app/src/data/models/reglamento_model.dart';
import 'package:appresort/app/src/data/services/helper_service.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:get/get.dart';

class ReglamentoController extends GetxController {
  ReglamentoController._internal();
  static ReglamentoController _instance = ReglamentoController._internal();
  static ReglamentoController get instance => _instance;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  RxList<ReglamentoModel> _reglamentos = List<ReglamentoModel>().obs;
  RxList<ReglamentoModel> get reglamentos => _reglamentos;

  @override
  void onInit() {
    getReglamentos();
    super.onInit();
  }

  Future<void> getReglamentos() async {
    _loading(true);
    final response = await HelperService.inst.reglamentos(
      desarrollo: GetStorages.inst.iddesarrollo,
    );
    _reglamentos.clear();
    if (response.status) {
      response.data.forEach(
        (item) => _reglamentos.add(ReglamentoModel.fromJson(item)),
      );
    }
    _loading(false);
  }
}
