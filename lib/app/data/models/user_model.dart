// To parse this JSON data, do
//
//     final UserModel = UserModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String nombre;
  String usuario;
  String nombreCompleto;
  String correo;
  String photo;
  String token;
  int sistema;
  int idpropietario;
  int iddesarrollo;

  UserModel({
      this.id,
      this.nombre,
      this.nombreCompleto,
      this.usuario,
      this.correo,
      this.photo,
      this.token,
      this.sistema,
      this.idpropietario,
      this.iddesarrollo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id              : int.parse(json["id"]),
      nombre          : json["nombre"],
      usuario         : json["usuario"],
      nombreCompleto  : json["nombreCompleto"],
      correo          : json["correo"],
      photo           : json["photo"],
      token           : json["token"],
      sistema         : int.parse(json["sistema"]),
      idpropietario   : int.parse(json["idpropietario"]),
      iddesarrollo    : int.parse(json["iddesarrollo"]),
  );

  Map<String, dynamic> toJson() => {
      "id"              : id,
      "nombre"          : nombre,
      "nombreCompleto"  : nombreCompleto,
      "usuario"         : usuario,
      "correo"          : correo,
      "photo"           : photo,
      "token"           : token,
      "sistema"         : sistema,
      "idpropietario"   : idpropietario,
      "iddesarrollo"    : iddesarrollo,
  };
}
