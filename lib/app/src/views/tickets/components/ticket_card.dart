import 'package:appresort/app/src/data/models/tickets_model.dart';
import 'package:appresort/app/src/widgets/ListTile/list_tile_default.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final TicketsModel ticket;
  final Function onPress;
  const TicketCard({
    Key key,
    this.ticket,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileDefault(
      text: ticket.descripcion,
      subtext: 'F-${ticket.folio}',
      bottom: 10.0,
      onPress: onPress,
    );
  }
}
