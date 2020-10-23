import 'dart:convert';

SaldosModel saldosModelFromJson(String str) => SaldosModel.fromJson(json.decode(str));

String saldosModelToJson(SaldosModel data) => json.encode(data.toJson());

class SaldosModel {
  String saldo;
  String cuotaord;
  String cuotaext;
  String mes;
  String anio;
  double total;
  bool estado;
  int cargo;

  SaldosModel({
      this.saldo,
      this.cuotaord,
      this.cuotaext,
      this.mes,
      this.anio,
      this.total,
      this.estado,
      this.cargo
  });

  factory SaldosModel.fromJson(Map<String, dynamic> json) => SaldosModel(
      saldo     : json["saldo"],
      cuotaord  : json["cuotaord"],
      cuotaext  : json["cuotaext"],
      mes       : json["mes"],
      anio      : json["anio"],
      total     : double.parse(json["total"]),
      estado    : int.parse(json["estado"]) == 0 ? false : true,
      cargo     : int.parse(json["cargo"]),
  );

  Map<String, dynamic> toJson() => {
      "saldo"     : saldo,
      "cuotaord"  : cuotaord,
      "cuotaext"  : cuotaext,
      "mes"       : mes,
      "anio"      : anio,
      "total"     : total,
      "estado"    : estado,
      "cargo"     : cargo,
  };
}
