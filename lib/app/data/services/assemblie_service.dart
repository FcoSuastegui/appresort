import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/assemblie_model.dart';
import 'package:appresort/app/data/models/list_page.dart';

class AssemblieService {
  static Future<ListPage<AssemblieModel>> getAssemblie(int page) async {
    final response = await Network.i.post(
      route: '/app/asambleas',
    );

    final List<AssemblieModel> list = List<AssemblieModel>();
    String message;
    response.status
        ? response.data.forEach((e) => list.add(AssemblieModel.fromJson(e)))
        : message = response.message;

    return ListPage<AssemblieModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }
}
