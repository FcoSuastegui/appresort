import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/helpers/network.dart';
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
        data: {"username": username, "password": password},
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

  Future<ResponseModel> profile({int idusuario, String token}) async {
    final ResponseModel request = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst
          .post(route: 'datosgenerales', data: {"idusuario": idusuario, "token": token});
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          request.status = body.status;
          request.data = body.data;
        } else {
          request.message = body.message;
        }
      }
    } on DioError catch (e) {
      request.message = e.error.toString();
    }
    return request;
  }

  Future<ResponseModel> changePassword({int idusuario, String password}) async {
    final ResponseModel request = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst
          .post(route: 'changepassword', data: {"idusuario": idusuario, "password": password});
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          request.status = body.status;
          request.message = body.message;
        } else {
          request.message = body.message;
        }
      }
    } on DioError catch (e) {
      request.message = e.error.toString();
    }
    return request;
  }
}
