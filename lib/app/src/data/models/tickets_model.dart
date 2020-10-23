
import 'dart:convert';

TicketsModel ticketsModelFromJson(String str) => TicketsModel.fromJson(json.decode(str));
String ticketsModelToJson(TicketsModel data) => json.encode(data.toJson());

class TicketsModel {
  TicketsModel({
    this.id,
    this.folio,
    this.descripcion,
    this.status,
  });

  int id;
  String folio;
  String descripcion;
  String status;

  factory TicketsModel.fromJson(Map<String, dynamic> json) => TicketsModel(
      id            : int.parse(json["id"]),
      folio         : json["folio"],
      descripcion   : json["descripcion"],
      status        : json["status"],
  );

  Map<String, dynamic> toJson() => {
      "id"            : id,
      "folio"         : folio,
      "descripcion"   : descripcion,
      "status"        : status,
  };
}


enum status {
  Pendiente,
}
// Modelo para las opciones de tickets

CatalogoTicketModel catalogoTicketModelFromJson(String str) => CatalogoTicketModel.fromJson(json.decode(str));
String catalogoTicketModelToJson(CatalogoTicketModel data) => json.encode(data.toJson());

class CatalogoTicketModel {
  CatalogoTicketModel({
    this.id,
    this.texto,
  });

  String id;
  String texto;

  factory CatalogoTicketModel.fromJson(Map<String, dynamic> json) => CatalogoTicketModel(
      id      : json["id"],
      texto   : json["nombre"],
  );

  Map<String, dynamic> toJson() => {
      "id"      : id,
      "texto"   : texto,
  };
}