import 'dart:convert';

TicketsModel ticketsModelFromJson(String str) => TicketsModel.fromJson(json.decode(str));
String ticketsModelToJson(TicketsModel data) => json.encode(data.toJson());

class TicketsModel {
  TicketsModel({
    this.id,
    this.folio,
    this.description,
    this.message,
    this.status,
  });

  String id;
  String folio;
  String message;
  String description;
  String status;

  factory TicketsModel.fromJson(Map<String, dynamic> json) => TicketsModel(
        id: json["id"] ?? '',
        folio: json["folio"] ?? '',
        description: json["description"] ?? '',
        message: json["message"] ?? '',
        status: json["status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "folio": folio,
        "description": description,
        "message": message,
        "status": status,
      };
}

enum status {
  Pendiente,
}
// Modelo para las opciones de tickets

CatalogoTicketModel catalogoTicketModelFromJson(String str) =>
    CatalogoTicketModel.fromJson(json.decode(str));
String catalogoTicketModelToJson(CatalogoTicketModel data) => json.encode(data.toJson());

class CatalogoTicketModel {
  CatalogoTicketModel({
    this.id,
    this.texto,
  });

  String id;
  String texto;

  factory CatalogoTicketModel.fromJson(Map<String, dynamic> json) => CatalogoTicketModel(
        id: json["id"],
        texto: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "texto": texto,
      };
}
