import 'package:appresort/app/data/models/tickets_model.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/tickets/controller/ticket_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TicketView extends GetView<TicketController> {
  static final String routeName = '/tickets';
  const TicketView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mis Tickets",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              Routes.goToPage("/ticket-add");
              await controller.obtenerCatalogoTicket();
            },
          )
        ],
      ),
      body: SliverScrollView(
        onRefresh: () => Future.sync(
          () => controller.pagingController.refresh(),
        ),
        slivers: [
          PagedSliverList.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<TicketsModel>(
              itemBuilder: (context, ticket, index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Adapt.px(20),
                  vertical: Adapt.px(20),
                ),
                child: ListTileCustom(
                  backgroundicon: Colors.indigo,
                  title: "Folio: ${ticket.folio}",
                  subtitle: ticket.description,
                  onPressed: () {
                    Routes.goToPage('/ticket-content');
                    controller.selectTicket(ticket);
                  },
                ),
              ),
              firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay tickets disponibles"),
              ),
              noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay tickets disponibles"),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: Adapt.px(0),
            ),
          ),
        ],
      ),
    );
  }
}
