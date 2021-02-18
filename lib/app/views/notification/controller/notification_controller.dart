import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/data/services/notification_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationController extends GetxController {
  NotificationController._internal();
  static NotificationController _instance = NotificationController._internal();
  static NotificationController get i => _instance;

  static const _pageSize = 10;

  final pagingController = PagingController<int, NotificationModel>(
    firstPageKey: 1,
  );

  RxInt _counter = 0.obs;
  int get counter => _counter.value;

  RxString _date = ''.obs;
  String get date => _date.value;
  set date(String v) => _date.value = v;

  NotificationModel _notification;
  NotificationModel get notification => _notification;

  @override
  void onInit() async {
    countNotification();
    pagingController.addPageRequestListener((pageKey) {
      getNotification(pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  Future<void> getNotification(int pageKey) async {
    final list = await NotificationService.show(
      idUser: int.parse(GetStorages.i.user.id),
      sistema: int.parse(GetStorages.i.user.sistema),
      page: pageKey,
    );

    if (list.message == null) {
      final isLastPage = list.itemList.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(list.itemList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(list.itemList, nextPageKey);
      }
    } else {
      pagingController.error = list.message;
    }
  }

  Future<void> countNotification() async {
    final total = await NotificationService.total(
      idUser: int.parse(GetStorages.i.user.id),
    );
    _counter(total);
  }

  Future<void> refresh() async {
    countNotification();
    pagingController.refresh();
  }

  Future<void> select(NotificationModel notification) async {
    _notification = notification;
    await NotificationService.read(
      idnotification: _notification.id,
    );
    refresh();
  }

  Future<void> delete(int id) async {
    final response = await NotificationService.delete(id: id);
    response.status
        ? Helper.success(message: response.message)
        : Helper.error(message: response.message);
    refresh();
  }
}
