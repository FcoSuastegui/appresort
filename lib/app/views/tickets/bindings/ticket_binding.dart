import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:get/get.dart';

class TicketBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketController());
  }
}
