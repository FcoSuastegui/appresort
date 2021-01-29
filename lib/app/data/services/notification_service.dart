import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/list_page.dart';
import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/data/models/response_model.dart';

class NotificationService {
  static Future<ListPage<NotificationModel>> notifications({
    int idusuario,
    int sistema,
  }) async {
    final response = await Network.i.post(
      route: '/app/listarNotificaciones',
      data: {'idusuario': idusuario, 'sistema': sistema},
    );

    final List<NotificationModel> list = List<NotificationModel>();
    String message;

    response.status
        ? response.data.forEach((e) => list.add(NotificationModel.fromJson(e)))
        : message = response.message;

    return ListPage<NotificationModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<ResponseModel> leerNotification({int idnotification}) async {
    return Network.i.post(
      route: '/app/leerNotificacion',
      data: {'idnotificacion': idnotification},
    );
  }
}
