import 'dart:convert';

ConektaModel conektaModelFromJson(String str) => ConektaModel.fromJson(json.decode(str));
String conektaModelToJson(ConektaModel data) => json.encode(data.toJson());

class ConektaModel {
    ConektaModel({
        this.object,
        this.type,
        this.message,
        this.messageToPurchaser,
        this.param,
        this.code,
        this.validationError,
        this.id,
        this.livemode,
        this.used,
    });

    String object;
    String type;
    String message;
    String messageToPurchaser;
    String param;
    String code;
    dynamic validationError;
    String id;
    bool livemode;
    bool used;

    factory ConektaModel.fromJson(Map<String, dynamic> json) => ConektaModel(
        object: json["object"],
        type: json["type"],
        message: json["message"],
        messageToPurchaser: json["message_to_purchaser"],
        param: json["param"],
        code: json["code"],
        validationError: json["validation_error"],
        id: json["id"],
        livemode: json["livemode"],
        used: json["used"],
    );

    Map<String, dynamic> toJson() => {
        "object": object,
        "type": type,
        "message": message,
        "message_to_purchaser": messageToPurchaser,
        "param": param,
        "code": code,
        "validation_error": validationError,
        "id": id,
        "livemode": livemode,
        "used": used,
    };
}
