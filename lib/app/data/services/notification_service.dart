import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/list_page.dart';
import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/utils/helper.dart';

class NotificationService {
  static Future<ListPage<NotificationModel>> notifications({
    int idusuario,
    int sistema,
    int page = 1,
  }) async {
    final response = await Network.i.post(
      route: '/app/listarNotificaciones',
      data: {
        'idusuario': idusuario,
        'sistema': sistema,
        'page': page,
      },
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

  static Future<int> totalNotificaciones({int idusuario}) async {
    int total = 0;
    final response = await Network.i.post(
      route: '/app/totalNotificaciones',
      data: {'idusuario': idusuario},
    );
    total = response.status ? Helper.numeric(response.data['total']) : 0;
    return total;
  }

  static Future<ResponseModel> leerNotification({int idnotification}) async {
    return Network.i.post(
      route: '/app/leerNotificacion',
      data: {'idnotificacion': idnotification},
    );
  }
}
