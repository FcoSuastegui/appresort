import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class ConektaService {
  static Future<ResponseModel> oxxoPago(Map<String, dynamic> datos) async {
    return Network.i.post(
      route: '/app/oxxo',
      data: datos,
    );
  }

  static Future<ResponseModel> payment(Map<String, dynamic> datos) async {
    return Network.i.post(
      route: '/app/tarjetaPago',
      data: datos,
    );
  }
}
