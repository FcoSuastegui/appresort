import 'package:appresort/app/src/views/tickets/controller/ticket_controller.dart';
import 'package:get/get.dart';

class TicketBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketController.instance);
  }
}