import 'dart:convert';

LastTransations lastTransationsFromJson(String str) => LastTransations.fromJson(json.decode(str));
String lastTransationsToJson(LastTransations data) => json.encode(data.toJson());

class LastTransations {
  LastTransations({
    this.id,
    this.cargo,
    this.abono,
    this.unidad,
    this.nombre,
    this.fecha,
    this.concepto,
    this.esCargo,
    this.tipoConcepto,
    this.metodo,
  });

  String id;
  String cargo;
  String abono;
  String unidad;
  String nombre;
  String fecha;
  String concepto;
  bool esCargo;
  String tipoConcepto;
  String metodo;

  factory LastTransations.fromJson(Map<String, dynamic> json) => LastTransations(
        id: json["id"] ?? '',
        cargo: json["cargo"] ?? '',
        abono: json["abono"] ?? '',
        unidad: json["unidad"] ?? '',
        nombre: json["nombre"] ?? '',
        fecha: json["fecha"] ?? '',
        concepto: json["concepto"] ?? '',
        esCargo: json["esCargo"] ?? false,
        tipoConcepto: json["tipoConcepto"] ?? '',
        metodo: json["metodo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cargo": cargo,
        "abono": abono,
        "unidad": unidad,
        "nombre": nombre,
        "fecha": fecha,
        "concepto": concepto,
        "esCargo": esCargo,
        "tipoConcepto": tipoConcepto,
        "metodo": metodo,
      };
}
