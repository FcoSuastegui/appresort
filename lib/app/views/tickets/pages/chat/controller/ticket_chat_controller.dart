import 'package:appresort/app/data/models/chat_model.dart';
import 'package:appresort/app/data/services/ticket_service.dart';
import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TicketChatController extends GetxController {
  static const _pageSize = 10;
  final ticket = Get.find<TicketController>().ticket;
  final user = Get.find<TicketController>().user;

  final chatController = PagingController<int, ChatModel>(
    firstPageKey: 1,
  );

  final ScrollController scroll = ScrollController();

  @override
  void onInit() {
    chatController.addPageRequestListener((pageKey) {
      getChat(pageKey);
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getChat(int pageKey) async {
    final list = await TicketService.ticketChat(
      idTicket: int.parse(ticket.id),
      idUser: int.parse(user.id),
      page: pageKey,
    );

    if (list.message == null) {
      final isLastPage = list.itemList.length < _pageSize;
      if (isLastPage) {
        chatController.appendLastPage(list.itemList);
      } else {
        final nextPageKey = pageKey + 1;
        chatController.appendPage(list.itemList, nextPageKey);
      }
    } else {
      chatController.error = list.message;
    }
  }

  Future<void> chatAdd(String s) async {
    await TicketService.ticketChatAdd(
      idTicket: int.parse(ticket.id),
      idUser: int.parse(user.id),
      message: s,
    );
    chatController.refresh();
  }
}
