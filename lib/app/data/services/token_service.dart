import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/helpers/network.dart';
import 'package:dio/dio.dart';

class TokenService {
  TokenService._internal();
  static TokenService _instance = TokenService._internal();
  static TokenService get inst => _instance;
  Future<ResponseModel> sendToken({int idusuario, String token}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'actualizarToken',
        data: {'idusuario': idusuario, 'token': token},
      );

      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          resquest.status = body.status;
          resquest.message = body.message;
        } else {
          resquest.message = body.message;
        }
      }
    } on DioError catch (e) {
      resquest.message = e.error.toString();
    }
    return resquest;
  }
}
