import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/balance_model.dart';
import 'package:appresort/app/data/models/list_page.dart';
import 'package:appresort/app/data/models/response_model.dart';

class BalanceService {
  static Future<ListPage<BalanceModel>> balance(int idpropietario) async {
    final response = await Network.i.post(
      route: '/app/saldos',
      data: {"idpropietario": idpropietario},
    );

    final List<BalanceModel> list = List<BalanceModel>();
    String message;
    response.status ? list.add(BalanceModel.fromJson(response.data)) : message = response.message;

    return ListPage<BalanceModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<double> total(int idPropietario) async {
    double total = 0.0;

    final response = await Network.i.post(
      route: '/app/balanceTotal',
      data: {
        'id_propietario': idPropietario,
      },
    );

    total = response.status ? double.parse(response.data['total']) : 0.0;

    return total;
  }

  static Future<String> bankStatement({
    int idPropietario = 0,
    int type = 1,
    int mes = 1,
    int anio = 2020,
  }) async {
    String file = '';

    final response = await Network.i.post(
      route: '/app/descargarEstadoDeCuenta',
      data: {
        'id_propietario': idPropietario,
        'type': 1,
        'mes': 12,
        'anio': 2020,
      },
    );

    file = response.status ? response.data['file'] : '';

    return file;
  }

  // processos desactualizados del servidor

  static Future<ResponseModel> getCharges(int idpropietario) async {
    return Network.i.post(
      route: '/app/saldosCargos',
      data: {"idpropietario": idpropietario},
    );
  }
/* 
  static Future<ResponseModel> bankStatement({int idpropietario, int sistema}) async {
    return Network.i.post(
      route: '/app/saldospdf',
      data: {"idpropietario": idpropietario, "sistema": sistema},
    );
  } */
}
