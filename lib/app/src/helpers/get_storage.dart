import 'package:get_storage/get_storage.dart';

class GetStorages {
  GetStorages._internal();
  static GetStorages _instance = GetStorages._internal();
  static GetStorages get inst => _instance;

  GetStorage _storage = GetStorage();

  Future<void> init() async => await GetStorage.init();
  Future<void> clear() async => await _storage.erase();

  // Setter y getters de datos

  set server(String valor) => _storage.write('server', valor);
  String get server => _storage.read('server') ?? 'https://qa.timeshareapp.com';

  set api(String value) => _storage.write('api', value);
  String get api => _storage.read('api') ?? "$server/api/app";

  // Token de la aplicación de laravel
  set token(String value) => _storage.write('token', value);
  String get token => _storage.read('token') ?? '';

  set page(String value) => _storage.write('page', value);
  String get page => _storage.read('page') ?? '/';

  set sistema(int value) => _storage.write('sistema', value);
  int get sistema => _storage.read('sistema') ?? 0;

  set idusuario(int value) => _storage.write('idusuario', value);
  int get idusuario => _storage.read('idusuario') ?? 0;

  set idsocio(int value) => _storage.write('idsocio', value);
  int get idsocio => _storage.read('idsocio') ?? 0;

  set avatar(String value) => _storage.write('avatar', "$server/$value");
  String get avatar =>
      _storage.read('avatar') ?? "$server/images/avatar-masculino.png";

  set nombre(String value) => _storage.write('nombre', value);
  String get nombre => _storage.read('nombre') ?? '';

  set email(String value) => _storage.write('email', value);
  String get email => _storage.read('email') ?? '';
}
