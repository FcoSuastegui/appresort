import 'package:appresort/app/src/data/models/response_model.dart';
import 'package:appresort/app/src/helpers/network.dart';
import 'package:dio/dio.dart';

class SaldoService {
  SaldoService._internal();
  static SaldoService _instance = SaldoService._internal();
  static SaldoService get inst => _instance;

  Future<ResponseModel> obtenerSaldo(int idpropietario) async {
    final ResponseModel respuesta = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'saldos',
        data: {
          "idpropietario": idpropietario,
        },
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

  Future<ResponseModel> obtenerCargos(int idpropietario) async {
    final ResponseModel respuesta = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'saldosCargos',
        data: {
          "idpropietario": idpropietario,
        },
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

Future<ResponseModel> estadoCuenta({ int idpropietario, int sistema }) async {
    final ResponseModel respuesta = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'saldospdf',
        data: {
          "idpropietario": idpropietario,
          "sistema" : sistema
        },
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
