class SelectModel {
  SelectModel({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory SelectModel.fromJson(Map<String, dynamic> json) => SelectModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
