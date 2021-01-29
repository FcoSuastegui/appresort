import 'package:appresort/app/data/models/perfil_model.dart';
import 'package:appresort/app/data/services/auth_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
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
    final request = await AuthService.profile(
      idusuario: int.parse(GetStorages.i.user.id),
      token: GetStorages.i.user.token,
    );
    if (request.status) {
      _perfil = PerfilModel.fromJson(request.data);
    }
    _loading(false);
  }
}