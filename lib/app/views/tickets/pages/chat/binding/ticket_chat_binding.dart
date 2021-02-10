import 'package:appresort/app/views/tickets/pages/chat/controller/ticket_chat_controller.dart';
import 'package:get/get.dart';

class TicketChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketChatController());
  }
}
