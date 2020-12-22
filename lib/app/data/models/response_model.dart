import 'dart:convert';

ResponseModel responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));
String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  dynamic data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    status    : json["status"],
    message   : json["message"],
    data      : json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status"    : status,
    "message"   : message,
    "data"      : data,
  };

}
