// To parse this JSON data, do
//
//     final UserModel = UserModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String name;
  String user;
  String fullname;
  String email;
  String photo;
  String token;
  String rol;
  String sistema;
  String idpropietario;
  String iddesarrollo;

  UserModel({
    this.id,
    this.name,
    this.fullname,
    this.user,
    this.email,
    this.photo,
    this.token,
    this.rol,
    this.sistema,
    this.idpropietario,
    this.iddesarrollo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        user: json["user"] ?? '',
        fullname: json["fullname"] ?? '',
        email: json["email"] ?? '',
        photo: json["photo"] ?? '',
        token: json["token"] ?? '',
        rol: json["rol"] ?? '',
        sistema: json["sistema"] ?? '',
        idpropietario: json["idpropietario"] ?? '',
        iddesarrollo: json["iddesarrollo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fullname": fullname,
        "user": user,
        "email": email,
        "photo": photo,
        "token": token,
        "rol": rol,
        "sistema": sistema,
        "idpropietario": idpropietario,
        "iddesarrollo": iddesarrollo,
      };
}
