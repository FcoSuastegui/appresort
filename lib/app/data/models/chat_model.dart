class ChatModel {
  final String username, message, photo, id;
  final bool sender;

  ChatModel({
    this.id,
    this.username,
    this.message,
    this.sender,
    this.photo,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["id"] ?? '',
        username: json["username"] ?? '',
        message: json["message"] ?? '',
        photo: json["photo"] ?? '',
        sender: json["sender"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "message": message,
        "photo": photo,
        "sender": sender,
      };
}
