
class PaymentMethod { 
  String name;
  String number;
  String expirationMonth;
  String expirationYear;
  String cvc;

  PaymentMethod({
    this.name,
    this.number,
    this.expirationMonth,
    this.expirationYear,
    this.cvc
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
      name                : json["name"],
      number              : json["number"],
      expirationMonth     : json["expirationMonth"],
      expirationYear      : json["expirationYear"],
  );

  Map<String, dynamic> toJson() => {
      "name"                : name,
      "number"              : number,
      "expirationMonth"     : expirationMonth,
      "expirationYear"      : expirationYear,
  };

}