import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingStepper extends StatelessWidget {
  final pages;
  final currentPages;

  OnBoardingStepper({
    @required this.pages,
    @required this.currentPages,
  }) : assert(pages != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _builPageIndicator(),
    );
  }

  List<Widget> _builPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < pages; i++) {
      list.add(i == currentPages ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Container(
        height: 5.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : AppTheme.kPrimaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: EdgeInsets.only(right: 5.0),
      ),
    );
  }
}
