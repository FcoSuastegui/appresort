import 'dart:convert';

BalanceModel balanceModelFromJson(String str) => BalanceModel.fromJson(json.decode(str));
String balanceModelToJson(BalanceModel data) => json.encode(data.toJson());

class BalanceModel {
  String saldo;
  String cuotaord;
  String cuotaext;
  String mes;
  String anio;
  double total;
  bool estado;
  int cargo;

  BalanceModel({
    this.saldo,
    this.cuotaord,
    this.cuotaext,
    this.mes,
    this.anio,
    this.total,
    this.estado,
    this.cargo,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        saldo: json["saldo"] ?? '',
        cuotaord: json["cuotaord"] ?? '',
        cuotaext: json["cuotaext"] ?? '',
        mes: json["mes"] ?? '',
        anio: json["anio"] ?? '',
        total: double.parse(json["total"]) ?? 0,
        estado: int.parse(json["estado"]) == 0 ? false : true,
        cargo: int.parse(json["cargo"]) ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "saldo": saldo,
        "cuotaord": cuotaord,
        "cuotaext": cuotaext,
        "mes": mes,
        "anio": anio,
        "total": total,
        "estado": estado,
        "cargo": cargo,
      };
}
