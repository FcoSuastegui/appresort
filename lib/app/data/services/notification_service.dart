import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/helpers/network.dart';
import 'package:dio/dio.dart';

class NotificationService {
  NotificationService._internal();
  static NotificationService _instance = NotificationService._internal();
  static NotificationService get inst => _instance;
  Future<ResponseModel> notifications({int idusuario, int sistema}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst
          .post(route: 'listarNotificaciones', data: {'idusuario': idusuario, 'sistema': sistema});

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

  Future<ResponseModel> leerNotification({int idnotification}) async {
    final ResponseModel request = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst
          .post(route: 'leerNotificacion', data: {'idnotificacion': idnotification});
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
