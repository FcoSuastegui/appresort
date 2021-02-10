import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:appresort/app/views/tickets/pages/ticket_add/components/ticket_add_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketAddView extends GetView<TicketController> {
  static final String routeName = '/ticket-add';
  const TicketAddView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nuevo ticket",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: TicketAddForm(),
        ),
      ),
    );
  }
}
