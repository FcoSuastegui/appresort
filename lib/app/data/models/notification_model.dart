import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  int id;
  String titulo;
  String descripcion;
  String icono;
  String pagina;
  bool status;

  NotificationModel({
    this.id,
    this.titulo,
    this.descripcion,
    this.icono,
    this.pagina,
    this.status
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id            : int.parse(json["id"]),
    titulo        : json["titulo"],
    descripcion   : json["descripcion"],
    icono         : json["icono"],
    pagina        : json["pagina"],
    status        : int.parse(json["status"]) == 1 ? true : false
  );

  Map<String, dynamic> toJson() => {
    "id"          : id,
    "titulo"      : titulo,
    "descripcion" : descripcion,
    "icono"       : icono,
    "pagina"      : pagina,
    "status"      : status
  };
}