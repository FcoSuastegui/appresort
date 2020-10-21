import 'package:appresort/app/src/data/models/response_model.dart';
import 'package:appresort/app/src/helpers/network.dart';
import 'package:dio/dio.dart';

class AuthService {
  AuthService._internal();
  static AuthService _instance = AuthService._internal();
  static AuthService get inst => _instance;


  Future<ResponseModel> login({String username, String password}) async {
    final ResponseModel respuesta = ResponseModel(
      status: false,
      message: '',
    );

    try {
      final Response response = await Network.inst.post(
        route: 'login',
        data: {username: username, password: password},
      );
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          respuesta.status = body.status;
          respuesta.data = body.data;
        } else {
          respuesta.message = body.message;
        }
      }
    } on DioError catch (e) {
      respuesta.message = e.error.toString();
    }
    return respuesta;
  }
}
