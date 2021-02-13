import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/list_page.dart';
import 'package:appresort/app/data/models/regulation_model.dart';
import 'package:appresort/app/data/models/response_model.dart';

class HelperService {
  static Future<ListPage<RegulationModel>> regulations({
    int desarrollo = 0,
    int page = 1,
  }) async {
    final response = await Network.i.post(
      route: '/app/regulations',
      data: {
        "desarrollo": desarrollo,
        "page": page,
      },
    );
    final List<RegulationModel> list = List<RegulationModel>();
    String message;
    response.status
        ? response.data.forEach((e) => list.add(RegulationModel.fromJson(e)))
        : message = response.message;

    return ListPage<RegulationModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<ResponseModel> publicKey() async {
    return Network.i.post(
      route: '/app/conektaKey',
    );
  }
}
