import 'package:appresort/app/src/data/models/response_model.dart';
import 'package:appresort/app/src/helpers/network.dart';
import 'package:dio/dio.dart';

class HelperService {
  HelperService._internal();
  static HelperService _instance = HelperService._internal();
  static HelperService get inst => _instance;

  Future<ResponseModel> reglamento({int idpropietario, int sistema}) async {
    final ResponseModel respuesta = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'avisoPrivacidad',
        data: {"idpropietario": idpropietario, "sistema": sistema},
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

  Future<ResponseModel> publicKey() async {
    final ResponseModel respuesta = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'conektaKey',
        data: {},
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
