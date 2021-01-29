import 'package:appresort/app/data/models/notification_model.dart';
import 'package:appresort/app/data/services/notification_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NotificationController extends GetxController {
  NotificationController._internal();
  static NotificationController _instance = NotificationController._internal();
  static NotificationController get i => _instance;

  static const _pageSize = 20;

  RxList<NotificationModel> _notifications = List<NotificationModel>().obs;
  RxList<NotificationModel> get notifications => _notifications;

  final pagingController = PagingController<int, NotificationModel>(
    firstPageKey: 1,
  );

  RxInt _counter = 0.obs;
  int get counter => _counter.value;

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
    final list = await NotificationService.notifications(
      idusuario: int.parse(GetStorages.i.user.id),
      sistema: int.parse(GetStorages.i.user.sistema),
    );

    if (list.message == null) {
      _counter(list.totalCount);
      final previouslyFetchedItemsCount = pagingController.itemList?.length ?? 0;

      final isLastPage = list.isLastPage(previouslyFetchedItemsCount);

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
    final list = await NotificationService.notifications(
      idusuario: int.parse(GetStorages.i.user.id),
      sistema: int.parse(GetStorages.i.user.sistema),
    );

    if (list.message == null) {
      _counter(list.totalCount);
    }
  }

  void selectNotification(NotificationModel notification) => _notification = notification;
}
