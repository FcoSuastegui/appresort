/* import 'package:appresort/app/views/tickets/components/ticket_card.dart';
import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:appresort/app/widgets/Informacion/no_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketContent extends GetView<TicketController> {
  const TicketContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.tickets.length > 0
        ? ListView(
            padding: EdgeInsets.only(top: 0.0),
            shrinkWrap: false,
            children: List.generate(
              controller.tickets.length,
              (index) => TicketCard(
                ticket: controller.tickets[index],
              ),
            ),
          )
        : NoInformationWidget(
            onPress: controller.listarTickets,
          );
  }
}
 */
