import 'package:appresort/app/src/data/models/response_model.dart';
import 'package:appresort/app/src/helpers/network.dart';
import 'package:dio/dio.dart';

class PublicacionService {
  PublicacionService._internal();
  static PublicacionService _instance = PublicacionService._internal();
  static PublicacionService get inst => _instance;
  Future<ResponseModel> publicaciones({int idusuario, int sistema}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await Network.inst.post(
        route: 'publicaciones',
        data: {"idusuario": idusuario, "sistema": sistema},
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
}
