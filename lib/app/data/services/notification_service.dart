import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class NotificationService {
  static Future<ResponseModel> notifications({int idusuario, int sistema}) async {
    return Network.i.post(
      route: '/app/listarNotificaciones',
      data: {'idusuario': idusuario, 'sistema': sistema},
    );
  }

  static Future<ResponseModel> leerNotification({int idnotification}) async {
    return Network.i.post(
      route: '/app/leerNotificacion',
      data: {'idnotificacion': idnotification},
    );
  }
}
