import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/balance_saldos_model.dart';
import 'package:appresort/app/data/models/balance_total_model.dart';
import 'package:appresort/app/data/models/charges_model.dart';
import 'package:appresort/app/data/models/last_transactions.dart';
import 'package:appresort/app/data/models/list_page.dart';

class BalanceService {
  static Future<ListPage<BalanceSaldoModel>> balance(int idpropietario) async {
    final response = await Network.i.post(
      route: '/app/balanceReport',
      data: {"id_propietario": idpropietario},
    );

    final List<BalanceSaldoModel> list = List<BalanceSaldoModel>();
    String message;
    response.status
        ? list.add(BalanceSaldoModel.fromJson(response.data))
        : message = response.message;

    return ListPage<BalanceSaldoModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<ListPage<LastTransations>> lastTransactions(int idpropietario) async {
    final response = await Network.i.post(
      route: '/app/lastTransactions',
      data: {"id_propietario": idpropietario},
    );

    final List<LastTransations> list = List<LastTransations>();
    String message;
    response.status
        ? response.data.forEach((e) => list.add(LastTransations.fromJson(e)))
        : message = response.message;

    return ListPage<LastTransations>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<ListPage<ChargesModel>> getCharges({
    int idpropietario = 0,
    int page = 1,
  }) async {
    final response = await Network.i.post(
      route: '/app/balanceCharges',
      data: {
        "id_propietario": idpropietario,
        "page": page,
      },
    );

    final List<ChargesModel> list = List<ChargesModel>();
    String message;
    response.status
        ? response.data.forEach((e) => list.add(ChargesModel.fromJson(e)))
        : message = response.message;

    return ListPage<ChargesModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<BalanceTotalModels> total(int idPropietario) async {
    final response = await Network.i.post(
      route: '/app/balanceTotal',
      data: {
        'id_propietario': idPropietario,
      },
    );

    return response.status
        ? BalanceTotalModels.fromJson(response.data)
        : BalanceTotalModels.fromJson({});
  }

  static Future<String> bankStatement({
    int idPropietario = 0,
    int type = 1,
    int mes = 1,
    int anio = 2020,
    int lastDay = 10,
  }) async {
    final response = await Network.i.post(
      route: '/app/descargarEstadoDeCuenta',
      data: {
        'id_propietario': idPropietario,
        'tipo': type,
        'mes': mes,
        'anio': anio,
        'diasEdo': lastDay
      },
    );

    return response.status ? response.data['file'] ?? '' : '';
  }
}
