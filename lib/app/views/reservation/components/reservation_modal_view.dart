import 'package:appresort/app/data/models/meeting_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservationModalView extends StatelessWidget {
  const ReservationModalView({Key key, this.reservation}) : super(key: key);
  final MeetingModel reservation;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: SizedBox.shrink(),
          middle: Text(
            reservation.name,
            style: TextStyle(
              fontSize: Adapt.getProportionateScreenWidth(14),
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
