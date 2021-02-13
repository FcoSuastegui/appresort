import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/list_page.dart';
import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/utils/helper.dart';

class NotificationService {
  static Future<ListPage<NotificationModel>> show({
    int idUser = 0,
    int sistema,
    int page = 1,
  }) async {
    final response = await Network.i.post(
      route: '/notification/show',
      data: {
        'id_user': idUser,
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

  static Future<int> total({int idUser = 0}) async {
    int total = 0;
    final response = await Network.i.post(
      route: '/notification/total',
      data: {'id_user': idUser},
    );
    total = response.status ? Helper.numeric(response.data['total']) : 0;
    return total;
  }

  static Future<ResponseModel> delete({int id = 0}) async {
    return await Network.i.post(
      route: '/notification/delete',
      data: {'id_notification': id},
    );
  }

  static Future<ResponseModel> read({int idnotification = 0}) async {
    return Network.i.post(
      route: '/notification/read',
      data: {'id_notification': idnotification},
    );
  }

  static Future<ResponseModel> playerId({
    String device = '',
    String playerId = '',
    int idUser = 0,
  }) async {
    return Network.i.post(
      route: '/notification/playerId',
      data: {
        "player_id": playerId,
        "device": device,
        "id_user": idUser,
      },
    );
  }
}
