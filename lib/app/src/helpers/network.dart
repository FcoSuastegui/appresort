import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Network {
  Network._internal();
  static Network _instance = Network._internal();
  static Network get inst => _instance;

  Dio _dio = Dio(
    BaseOptions(
      baseUrl: "${GetStorages.inst.api}/app",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: _setHeaders,
    ),
  );
  // Servicios
  Future<Response> postFormData({String route, Map<String, dynamic> data}) async => await _dio.post("/$route", data: FormData.fromMap(data));
  Future<Response> post({@required String route, Map<String, dynamic> data}) async =>  await _dio.post("/$route", data: data);
  Future<Response> get(String route) async => await _dio.get("/$route");

  static Map<String, String> _setHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}
