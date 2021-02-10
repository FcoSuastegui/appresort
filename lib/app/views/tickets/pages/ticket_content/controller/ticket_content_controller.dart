import 'package:appresort/app/data/models/time_line_model.dart';
import 'package:appresort/app/data/services/ticket_service.dart';
import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TicketContentController extends GetxController {
  static const _pageSize = 10;
  final timeLineController = PagingController<int, TimeLineModel>(
    firstPageKey: 1,
  );

  final ticket = Get.find<TicketController>().ticket;

  @override
  void onInit() {
    timeLineController.addPageRequestListener((pageKey) {
      getTimeLine(pageKey);
    });
    super.onInit();
  }

  Future<void> getTimeLine(int pageKey) async {
    final list = await TicketService.ticketTimeLine(
      idTicket: int.parse(ticket.id),
      page: pageKey,
    );

    print(list);

    if (list.message == null) {
      final isLastPage = list.itemList.length < _pageSize;
      if (isLastPage) {
        timeLineController.appendLastPage(list.itemList);
      } else {
        final nextPageKey = pageKey + 1;
        timeLineController.appendPage(list.itemList, nextPageKey);
      }
    } else {
      timeLineController.error = list.message;
    }
  }
}
