class ChargesModel {
  ChargesModel({
    this.id,
    this.unidad,
    this.fechaCargo,
    this.concepto,
    this.tipo,
    this.cargo,
    this.montoAbonado,
    this.status,
    this.total,
  });

  String id;
  String unidad;
  String fechaCargo;
  String concepto;
  String tipo;
  String cargo;
  String montoAbonado;
  String status;
  double total;

  factory ChargesModel.fromJson(Map<String, dynamic> json) => ChargesModel(
        id: json["id"] ?? '',
        unidad: json["unidad"] ?? '',
        fechaCargo: json["fecha_cargo"] ?? '',
        concepto: json["concepto"] ?? '',
        tipo: json["tipo"] ?? '',
        cargo: json["cargo"] ?? '',
        montoAbonado: json["monto_abonado"] ?? '',
        status: json["status"] ?? '',
        total: double.parse(json["total"] ?? "0.00"),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unidad": unidad,
        "fecha_cargo": fechaCargo,
        "concepto": concepto,
        "tipo": tipo,
        "cargo": cargo,
        "monto_abonado": montoAbonado,
        "status": status,
        "total": total,
      };
}
