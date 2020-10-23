import 'package:appresort/app/src/data/models/response_model.dart';
import 'package:appresort/app/src/helpers/network.dart';
import 'package:dio/dio.dart';

class ConektaService {
  ConektaService._internal();
  static ConektaService _instance = ConektaService._internal();
  static ConektaService get inst => _instance;

  Future<ResponseModel> oxxoPago(Map<String, dynamic> datos) async {
    final ResponseModel respuesta = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'oxxo',
        data: datos,
      );
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          respuesta.status = body.status;
          respuesta.message = body.message;
        } else {
          respuesta.message = body.message;
        }
      }
    } on DioError catch (e) {
      respuesta.message = e.error.toString();
    }
    return respuesta;
  }

  Future<ResponseModel> payment(Map<String, dynamic> datos) async {
    final ResponseModel respuesta = ResponseModel(
      status: false,
      message: '',
    );

    try {
      final Response response = await Network.inst.post(
        route: 'tarjetaPago',
        data: datos,
      );
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          respuesta.status = body.status;
          respuesta.message = body.message;
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
