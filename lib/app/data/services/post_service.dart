import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/list_page.dart';
import 'package:appresort/app/data/models/post_model.dart';

class PostService {
  static Future<ListPage<PostModel>> posts({int idusuario, int sistema}) async {
    final response = await Network.i.post(
      route: '/app/publicaciones',
      data: {"idusuario": idusuario, "sistema": sistema},
    );
    final List<PostModel> list = List<PostModel>();
    String message;
    response.status
        ? response.data.forEach((e) => list.add(PostModel.fromJson(e)))
        : message = response.message;

    return ListPage<PostModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }
}
