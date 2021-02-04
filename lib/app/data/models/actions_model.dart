import 'package:flutter/material.dart';

class ActionsModel {
  Color backGroundColor;
  Icon icon;
  String title;
  String page;

  ActionsModel({
    this.title,
    this.backGroundColor,
    this.icon,
    this.page,
  });

  factory ActionsModel.fromJson(Map<String, dynamic> json) => ActionsModel(
        title: json["title"],
        page: json["page"],
        icon: json["icon"],
        backGroundColor: json["backGroundColor"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "page": page,
        "backGroundColor": backGroundColor,
      };
}
