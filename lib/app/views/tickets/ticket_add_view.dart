import 'package:appresort/app/views/tickets/components/ticket_add_form.dart';
import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';

class TicketAddView extends GetView<TicketController> {
  static final String routeName = '/ticket-add';
  const TicketAddView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Nuevo ticket"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: TicketAddForm(),
        ),
      ),
    );
  }
}
