import 'dart:convert';

PublicacionModel publicacionModelFromJson(String str) => PublicacionModel.fromJson(json.decode(str));
String publicacionModelToJson(PublicacionModel data) => json.encode(data.toJson());

class PublicacionModel {
  PublicacionModel({
    this.titulo,
    this.tipoMedia,
    this.desarrollo,
    this.avatar,
    this.fechaPublicacion,
    this.contenido,
    this.imagen,
  });

  String titulo;
  String tipoMedia;
  String desarrollo;
  String avatar;
  String fechaPublicacion;
  String contenido;
  String imagen;

  factory PublicacionModel.fromJson(Map<String, dynamic> json) => PublicacionModel(
      titulo            : json["titulo"],
      tipoMedia         : json["tipoMedia"],
      desarrollo        : json["desarrollo"],
      avatar            : json["avatar"],
      fechaPublicacion  : json["fechaPublicacion"],
      contenido         : json["contenido"],
      imagen            : json["imagen"],
  );

  Map<String, dynamic> toJson() => {
      "titulo"            : titulo,
      "tipoMedia"         : tipoMedia,
      "desarrollo"        : desarrollo,
      "avatar"            : avatar,
      "fechaPublicacion"  : fechaPublicacion,
      "contenido"         : contenido,
      "imagen"            : imagen,
  };
}
