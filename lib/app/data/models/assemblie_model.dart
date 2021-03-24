class AssemblieModel {
  AssemblieModel({
    this.id,
    this.nombre,
    this.ruta,
  });

  int id;
  String nombre;
  String ruta;

  factory AssemblieModel.fromJson(Map<String, dynamic> json) => AssemblieModel(
        id: json["id"] ?? 0,
        nombre: json["nombre"] ?? '',
        ruta: json["ruta"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "ruta": ruta,
      };
}
