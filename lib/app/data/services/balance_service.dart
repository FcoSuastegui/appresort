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

  static Future<ResponseModel> getCharges(int idpropietario) async {
    return Network.i.post(
      route: '/app/saldosCargos',
      data: {"idpropietario": idpropietario},
    );
  }

  static Future<ResponseModel> bankStatement({int idpropietario, int sistema}) async {
    return Network.i.post(
      route: '/app/saldospdf',
      data: {"idpropietario": idpropietario, "sistema": sistema},
    );
  }
}
