import 'package:appresort/app/src/routes/routes.dart';
import 'package:appresort/app/src/views/tickets/components/ticket_content.dart';
import 'package:appresort/app/src/views/tickets/controller/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:appresort/app/src/widgets/Appbars/app_bar_default.dart';
import 'package:get/get.dart';

class TicketView extends GetView<TicketController> {
  static final String routeName = '/ticket';
  const TicketView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Mis Tickets"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle, color: Colors.white),
            onPressed: () async {
              Routes.inst.goToPage("/ticket-add");
              await controller.obtenerCatalogoTicket();
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Obx(
          () => controller.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : TicketContent(),
        ),
      ),
    );
  }
}
