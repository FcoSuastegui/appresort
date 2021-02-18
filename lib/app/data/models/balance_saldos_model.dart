import 'dart:convert';

BalanceSaldoModel balanceSaldoModelFromJson(String str) =>
    BalanceSaldoModel.fromJson(json.decode(str));

String balanceSaldoModelToJson(BalanceSaldoModel data) => json.encode(data.toJson());

class BalanceSaldoModel {
  BalanceSaldoModel({
    this.total,
    this.saldos,
    this.fondos,
  });

  int total;
  List<Saldo> saldos;
  List<Fondo> fondos;

  factory BalanceSaldoModel.fromJson(Map<String, dynamic> json) => BalanceSaldoModel(
        total: json["total"] ?? 0,
        saldos: json["saldos"] != null
            ? List<Saldo>.from(json["saldos"].map((x) => Saldo.fromJson(x)))
            : List<Saldo>(),
        fondos: json["fondos"] != null
            ? List<Fondo>.from(json["fondos"].map((x) => Fondo.fromJson(x)))
            : List<Fondo>(),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "saldos": List<dynamic>.from(saldos.map((x) => x.toJson())),
      };
}

class Saldo {
  Saldo({
    this.id,
    this.unidad,
    this.concepto,
    this.saldo,
  });

  String id;
  String unidad;
  String concepto;
  String saldo;

  factory Saldo.fromJson(Map<String, dynamic> json) => Saldo(
        id: json["id"] ?? '',
        unidad: json["unidad"] ?? '',
        concepto: json["concepto"] ?? '',
        saldo: json["saldo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unidad": unidad,
        "concepto": concepto,
        "saldo": saldo,
      };
}

class Fondo {
  Fondo({
    this.id,
    this.saldo,
    this.fondo,
  });

  String id;
  String fondo;
  String saldo;

  factory Fondo.fromJson(Map<String, dynamic> json) => Fondo(
        id: json["id"] ?? '',
        fondo: json["fondo"] ?? '',
        saldo: json["saldo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fondo": fondo,
        "saldo": saldo,
      };
}
