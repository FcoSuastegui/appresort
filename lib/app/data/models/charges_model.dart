class ChargesModel {
  ChargesModel({
    this.id,
    this.unidad,
    this.idUnidad,
    this.fechaCargo,
    this.concepto,
    this.idTipoConcepto,
    this.tipo,
    this.cargo,
    this.montoAbonado,
    this.status,
    this.total,
  });

  String id;
  String unidad;
  String idUnidad;
  String fechaCargo;
  String concepto;
  String idTipoConcepto;
  String tipo;
  String cargo;
  String montoAbonado;
  String status;
  double total;

  factory ChargesModel.fromJson(Map<String, dynamic> json) => ChargesModel(
        id: json["id"] ?? '',
        unidad: json["unidad"] ?? '',
        idUnidad: json["id_unidad"] ?? '',
        fechaCargo: json["fecha_cargo"] ?? '',
        concepto: json["concepto"] ?? '',
        idTipoConcepto: json["id_tipo_concepto"] ?? '0',
        tipo: json["tipo"] ?? '',
        cargo: json["cargo"] ?? '',
        montoAbonado: json["monto_abonado"] ?? '',
        status: json["status"] ?? '',
        total: double.parse(json["total"] ?? "0.00"),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "unidad": unidad,
        "id_unidad": idUnidad,
        "fecha_cargo": fechaCargo,
        "concepto": concepto,
        "id_tipo_concepto": idTipoConcepto,
        "tipo": tipo,
        "cargo": cargo,
        "monto_abonado": montoAbonado,
        "status": status,
        "total": total,
      };
}
