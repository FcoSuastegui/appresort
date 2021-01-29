import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class HelperService {
  static Future<ResponseModel> reglamentos({int desarrollo}) async {
    return Network.i.post(
      route: '/app/reglamentos',
      data: {"desarrollo": desarrollo},
    );
  }

  static Future<ResponseModel> publicKey() async {
    return Network.i.post(
      route: '/app/conektaKey',
    );
  }
}
