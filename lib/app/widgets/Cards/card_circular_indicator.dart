import 'package:appresort/app/themes/adapt.dart';
import 'package:flutter/material.dart';

class CardCirculaIndicator extends StatelessWidget {
  final double margin;
  const CardCirculaIndicator({
    Key key,
    this.margin = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Adapt.px(margin),
      ),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1.0,
        ),
      ),
    );
  }
}
