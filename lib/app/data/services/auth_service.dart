import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class AuthService {
  static Future<ResponseModel> login({String username, String password}) async {
    return Network.i.post(
      route: '/app/login',
      data: {"username": username, "password": password},
    );
  }

  static Future<ResponseModel> changePassword({int idusuario, String password}) async {
    return Network.i.post(
      route: '/app/changepassword',
      data: {"idusuario": idusuario, "password": password},
    );
  }
}
