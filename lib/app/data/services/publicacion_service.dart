import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class PublicacionService {
  static Future<ResponseModel> publicaciones({int idusuario, int sistema}) async {
    return Network.i.post(
      route: '/app/publicaciones',
      data: {"idusuario": idusuario, "sistema": sistema},
    );
  }
}
