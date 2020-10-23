import 'package:appresort/app/src/data/models/perfil_model.dart';
import 'package:appresort/app/src/data/services/auth_service.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController._internal();
  static ProfileController _instance = ProfileController._internal();
  static ProfileController get instance => _instance;

  PerfilModel _perfil;
  PerfilModel get perfil => _perfil;

  RxBool _loading = false.obs;
  bool get loading => _loading.value;

  @override
  void onInit() {
    cargarPerfil();
    super.onInit();
  }

  Future<void> cargarPerfil() async {
    _loading(true);
    final request = await AuthService.inst.profile(
      idusuario: GetStorages.inst.idusuario,
      token: GetStorages.inst.token,
    );
    if (request.status) {
      _perfil = PerfilModel.fromJson(request.data);
    }
    print(_loading.value);
    _loading(false);
  }
}
