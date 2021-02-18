import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class Network {
  Network._internal();
  static Network _instance = Network._internal();
  static Network get i => _instance;

  Dio _dio = Dio(
    BaseOptions(
      baseUrl: GetStorages.i.api,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: _setHeaders,
    ),
  );

  Future<ResponseModel> post({@required route, data = const {}}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await _dio.post(route, data: data);
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          resquest.status = body.status;
          resquest.data = body.data;
          resquest.message = body.message;
        } else {
          resquest.message = body.message;
        }
      }
    } on DioError catch (e) {
      resquest.message =
          "${_getResponseCode(e.response?.statusCode.toString())} \n ${e.error.toString()}";
    }
    return resquest;
  }

  Future<ResponseModel> postFormData({@required route, data = const {}}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      FormData formData = FormData.fromMap(data);
      final Response response = await _dio.post(route, data: formData);
      if (response.statusCode == 200) {
        final ResponseModel body = ResponseModel.fromJson(response.data);
        if (body.status) {
          resquest.status = body.status;
          resquest.data = body.data;
          resquest.message = body.message;
        } else {
          resquest.message = body.message;
        }
      }
    } on DioError catch (e) {
      resquest.message =
          "${_getResponseCode(e.response?.statusCode.toString())} \n ${e.error.toString()}";
    }
    return resquest;
  }

  Future<ResponseModel> get({@required route}) async {
    final ResponseModel resquest = ResponseModel(
      status: false,
      message: '',
    );
    try {
      final Response response = await _dio.get(route);
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

  static Map<String, String> _setHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String _getResponseCode(String code) {
    Map<String, dynamic> codes = {
      "400": "bad-request".tr,
      "405": "method-not-allowed".tr,
    };

    return codes[code] ?? "Contenido desconocido";
  }
}
