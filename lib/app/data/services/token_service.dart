import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class TokenService {
  static Future<ResponseModel> sendToken({int idusuario, String token}) async {
    return Network.i.post(
      route: '/app/actualizarToken',
      data: {'idusuario': idusuario, 'token': token},
    );
  }
}
