// To parse this JSON data, do
//
//     final perfilModel = perfilModelFromJson(jsonString);

import 'dart:convert';

PerfilModel perfilModelFromJson(String str) => PerfilModel.fromJson(json.decode(str));

String perfilModelToJson(PerfilModel data) => json.encode(data.toJson());

class PerfilModel {
  String nombre;
  String logo;
  String usuario;
  String correo;
  String nss;
  String rfc;
  String numCredito;

  PerfilModel({
    this.nombre,
    this.logo,
    this.usuario,
    this.correo,
    this.nss,
    this.rfc,
    this.numCredito,
  });

  factory PerfilModel.fromJson(Map<String, dynamic> json) => PerfilModel(
      nombre      : json["nombre"]?? '',
      logo        : json["logo"]?? '',
      usuario     : json["usuario"]?? '',
      correo      : json["correo"]?? '',
      nss         : json["nss"]?? '',
      rfc         : json["rfc"]?? '',
      numCredito  : json["numCredito"]?? '',
  );

  Map<String, dynamic> toJson() => {
      "nombre"      : nombre,
      "logo"        : logo,
      "usuario"     : usuario,
      "correo"      : correo,
      "nss"         : nss,
      "rfc"         : rfc,
      "numCredito"  : numCredito,
  };
}
