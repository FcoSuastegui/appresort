import 'dart:convert';

ReglamentoModel reglamentoModelFromJson(String str) =>
    ReglamentoModel.fromJson(json.decode(str));

String reglamentoModelToJson(ReglamentoModel data) =>
    json.encode(data.toJson());

class ReglamentoModel {
  ReglamentoModel({
    this.id,
    this.nombre,
    this.ruta,
  });

  String id;
  String nombre;
  String ruta;

  factory ReglamentoModel.fromJson(Map<String, dynamic> json) =>
      ReglamentoModel(
        id: json["id"],
        nombre: json["nombre"],
        ruta: json["ruta"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "ruta": ruta,
      };
}
