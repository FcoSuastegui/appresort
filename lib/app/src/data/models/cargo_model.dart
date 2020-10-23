
import 'dart:convert';

CargoModel cargoModelFromJson(String str) => CargoModel.fromJson(json.decode(str));
String cargoModelToJson(CargoModel data) => json.encode(data.toJson());

class CargoModel {
  CargoModel({
    this.idcargo,
    this.idconcepto,
    this.mov,
    this.cargo,
    this.status,
    this.mes,
    this.anio,
    this.concepto,
    this.fecha,
    this.abonado,
    this.total
  });

  int idcargo;
  int idconcepto;
  String mov;
  double cargo;
  bool status;
  String mes;
  String anio;
  String concepto;
  String fecha;
  double abonado;
  double total;

  factory CargoModel.fromJson(Map<String, dynamic> json) => CargoModel(
    idcargo     : int.parse(json["idcargo"]),
    idconcepto  : int.parse(json["idconcepto"]),
    mov         : json["mov"],
    cargo       : double.parse(json["cargo"]),
    status      : int.parse(json["status"]) == 1 ? false : true,
    mes         : json["mes"],
    anio        : json["anio"],
    concepto    : json["concepto"],
    fecha       : json["fecha"],
    abonado     : double.parse(json["abonado"]),
    total       : double.parse(json["total"])
  );

  Map<String, dynamic> toJson() => {
    "idcargo"     : idcargo,
    "idconcepto"  : idconcepto,
    "mov"         : mov,
    "cargo"       : cargo,
    "status"      : status,
    "mes"         : mes,
    "anio"        : anio,
    "concepto"    : concepto,
    "fecha"       : fecha,
    "abonado"     : abonado,
    "total"       : total,
  };
}
