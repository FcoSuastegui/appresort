import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  int id;
  String title;
  String subtitle;
  String description;
  String icon;
  String page;
  String time;
  String sender;
  String senderAvatar;
  bool status;

  NotificationModel({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.icon,
    this.page,
    this.time,
    this.sender,
    this.senderAvatar,
    this.status,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: int.parse(json["id"]),
        title: json["title"] ?? '',
        subtitle: json["subtitle"] ?? '',
        description: json["description"] ?? '',
        icon: json["icon"] ?? '',
        page: json["page"] ?? '',
        time: json["date"] ?? '',
        sender: json["sender"] ?? '',
        senderAvatar: json["sender_avatar"] ?? '',
        status: int.parse(json["status"]) == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "icon": icon,
        "page": page,
        "time": time,
        "sender": sender,
        "senderAvatar": senderAvatar,
        "status": status
      };
}
