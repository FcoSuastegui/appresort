import 'package:appresort/app/data/conekta/conekta_flutter_token.dart';
import 'package:appresort/app/data/conekta/conekta_model.dart';
import 'package:appresort/app/data/conekta/payment_model.dart';
import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class ConektaService {
  static Future<String> conektaKey() async {
    final response = await Network.i.post(
      route: '/conekta/publicKey',
    );
    return response.status ? response.data['public_key'] ?? '' : '';
  }

  static Future<ResponseModel> oxxoPago(Map<String, dynamic> datos) async {
    return Network.i.post(
      route: '/conekta/oxxo',
      data: datos,
    );
  }

  static Future<ResponseModel> creditCard(Map<String, dynamic> datos) async {
    final ResponseModel response = ResponseModel(status: false, message: '');

    final ConektaModel token = await ConektaFlutterTokenizer().tokenizePaymentMethod(
      PaymentMethod(
        name: datos['name'],
        number: datos['number'],
        expirationMonth: datos['month'],
        expirationYear: datos['year'],
        cvc: datos['cvv'],
      ),
    );
    if (token.object == 'error') {
      response.message = " ${token.messageToPurchaser}";
      return response;
    }

    datos['token'] = token.id;

    return Network.i.post(
      route: '/conekta/creditCard',
      data: datos,
    );
  }
}
