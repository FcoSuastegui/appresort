import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class SaldoService {
  static Future<ResponseModel> obtenerSaldo(int idpropietario) async {
    return Network.i.post(
      route: '/app/saldos',
      data: {"idpropietario": idpropietario},
    );
  }

  static Future<ResponseModel> obtenerCargos(int idpropietario) async {
    return Network.i.post(
      route: '/app/saldosCargos',
      data: {"idpropietario": idpropietario},
    );
  }

  static Future<ResponseModel> estadoCuenta({int idpropietario, int sistema}) async {
    return Network.i.post(
      route: '/app/saldospdf',
      data: {"idpropietario": idpropietario, "sistema": sistema},
    );
  }
}
