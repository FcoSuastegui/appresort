import 'package:appresort/app/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class GetStorages {
  GetStorages._internal();
  static GetStorages _instance = GetStorages._internal();
  static GetStorages get i => _instance;

  GetStorage _storage = GetStorage();

  Future<void> init() async => await GetStorage.init();
  String validarToken() => !JwtDecoder.isExpired(user.token) ? page : '/';
  Future<void> clear() async => await _storage.erase();

  // Setter y getters de datos

  set server(String valor) => _storage.write('server', valor);
  String get server => _storage.read('server') ?? 'https://qa.midesarrollo.com.mx';

  set api(String valor) => _storage.write('api', valor);
  String get api => _storage.read('api') ?? '$server/server/api';

  set page(String valor) => _storage.write('page', valor);
  String get page => _storage.read('page') ?? '/';

  set onboarding(bool valor) => _storage.write('onboarding', valor);
  bool get onboarding => _storage.read('onboarding') ?? true;

  set user(UserModel userModel) {
    userModel.photo = userModel.photo == null || userModel.photo.isEmpty
        ? "$server/../site_media/assets/images/profile-image.png"
        : userModel.photo;

    _storage.write('user', userModel.toJson());
  }

  UserModel get user => UserModel.fromJson(_storage.read('user') ?? {});
}
