import 'package:flutter/material.dart';

class LinnerContainer extends StatelessWidget {
  final double top, left, right, width, buttom;
  LinnerContainer({ this.top = 0.0, this.left = 0.0, this.right = 0.0, this.buttom = 0.0, this.width = 0.02});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: top, left: left, right: right, bottom: buttom),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.grey[400],
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Colors.grey[400],
            ),
          ],
          border: Border.all(width: width, color: Colors.grey[400])
      )
    );
  }
}