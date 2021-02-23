class BalanceTotalModels {
  BalanceTotalModels({
    this.total,
    this.fondo,
  });

  double total;
  double fondo;

  factory BalanceTotalModels.fromJson(Map<String, dynamic> json) => BalanceTotalModels(
        total: double.parse(json["total"] ?? 0.00),
        fondo: double.parse(json["fondo"] ?? 0.00),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "fondo": fondo,
      };
}
