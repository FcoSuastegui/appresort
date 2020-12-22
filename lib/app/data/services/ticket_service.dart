import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/helpers/network.dart';
import 'package:dio/dio.dart';

class TicketService {
  TicketService._internal();
  static TicketService _instance = TicketService._internal();
  static TicketService get inst => _instance;

  Future<ResponseModel> tickets({int idpropietario, int sistema}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'tickets',
        data: {"idpropietario": idpropietario, "sistema": sistema},
      );

      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          resquest.status = body.status;
          resquest.data = body.data;
        } else {
          resquest.message = body.message;
        }
      }
    } on DioError catch (e) {
      resquest.message = e.error.toString();
    }
    return resquest;
  }

  Future<ResponseModel> catalogoTicket({int idpropietario, int sistema}) async {
    final ResponseModel request = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'catalogosTickets',
        data: {"idpropietario": idpropietario, "sistema": sistema},
      );
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

  Future<ResponseModel> addTicket(Map<String, dynamic> data) async {
    final ResponseModel request = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.postFormData(
        route: 'agregarTicket',
        data: data,
      );
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
