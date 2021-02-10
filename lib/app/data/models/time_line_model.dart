import 'dart:convert';

TimeLineModel timeLineModelFromJson(String str) => TimeLineModel.fromJson(json.decode(str));

String timeLineModelToJson(TimeLineModel data) => json.encode(data.toJson());

class TimeLineModel {
  TimeLineModel({
    this.id,
    this.message,
    this.date,
    this.process,
  });

  String id;
  String message;
  String date;
  String process;

  factory TimeLineModel.fromJson(Map<String, dynamic> json) => TimeLineModel(
        id: json["id"] ?? '',
        message: json["message"] ?? '',
        date: json["date"] ?? '',
        process: json["process"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "date": date,
        "process": process,
      };
}
