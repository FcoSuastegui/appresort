import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class MeetingModel {
  MeetingModel({
    this.id,
    this.name,
    this.from,
    this.to,
    this.cantidad,
    this.descripcion,
    this.idArea,
    this.idHorario,
    this.idUnidad,
    this.background,
    this.isAllDay,
  });

  int id;
  String name;
  DateTime from;
  DateTime to;
  int cantidad;
  String descripcion;
  int idArea;
  int idHorario;
  int idUnidad;
  Color background;
  bool isAllDay;

  factory MeetingModel.fromJson(Map<String, dynamic> json) => MeetingModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        from: json["from"],
        to: json["to"],
        cantidad: json["cantidad"] ?? 0,
        descripcion: json["descripcion"] ?? '',
        idArea: json["id_area"] ?? 0,
        idHorario: json["id_horario"] ?? 0,
        idUnidad: json["id_unidad"] ?? 0,
        isAllDay: json["is_all_day"] ?? false,
        background: json["background"] ?? AppTheme.kPrimaryColor,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "from": from,
        "to": to,
        "cantidad": cantidad,
        "descripcion": descripcion,
        "idArea": idArea,
        "idHorario": idHorario,
        "idUnidad": idUnidad,
        "isAllDay": isAllDay,
        "background": background,
      };
}
