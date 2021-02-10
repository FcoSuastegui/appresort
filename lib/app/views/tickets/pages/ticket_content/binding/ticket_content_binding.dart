import 'package:appresort/app/views/tickets/pages/ticket_content/controller/ticket_content_controller.dart';
import 'package:get/get.dart';

class TicketContentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketContentController());
  }
}
