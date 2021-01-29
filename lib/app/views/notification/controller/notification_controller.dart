import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/data/services/notification_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationController._internal();
  static NotificationController _instance = NotificationController._internal();
  static NotificationController get i => _instance;

  RxList<NotificationModel> _notifications = List<NotificationModel>().obs;
  RxList<NotificationModel> get notifications => _notifications;

  RxInt _counter = 0.obs;
  RxInt get counter => _counter;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  NotificationModel _notification;
  NotificationModel get notification => _notification;

  @override
  void onInit() async {
    await getNotification();
    super.onInit();
  }

  Future<void> getNotification() async {
    _loading(true);
    final response = await NotificationService.notifications(
      idusuario: int.parse(GetStorages.i.user.id),
      sistema: int.parse(GetStorages.i.user.sistema),
    );
    _notifications.clear();

    if (response.status) {
      response.data.forEach((item) {
        _notifications.add(NotificationModel.fromJson(item));
      });
      _counter(_notifications.length);
    }
    _loading(false);
  }

  void selectNotification(NotificationModel notification) => _notification = notification;
}
