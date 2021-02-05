import 'dart:convert';

RegulationModel regulationModelFromJson(String str) => RegulationModel.fromJson(json.decode(str));
String regulationModelToJson(RegulationModel data) => json.encode(data.toJson());

class RegulationModel {
  RegulationModel({
    this.id,
    this.nombre,
    this.ruta,
  });

  String id;
  String nombre;
  String ruta;

  factory RegulationModel.fromJson(Map<String, dynamic> json) => RegulationModel(
        id: json["id"] ?? '',
        nombre: json["nombre"] ?? '',
        ruta: json["ruta"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "ruta": ruta,
      };
}
