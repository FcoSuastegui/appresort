import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));
String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
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

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        titulo: json["titulo"],
        tipoMedia: json["tipoMedia"],
        desarrollo: json["desarrollo"],
        avatar: json["avatar"],
        fechaPublicacion: json["fechaPublicacion"],
        contenido: json["contenido"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "tipoMedia": tipoMedia,
        "desarrollo": desarrollo,
        "avatar": avatar,
        "fechaPublicacion": fechaPublicacion,
        "contenido": contenido,
        "imagen": imagen,
      };
}
