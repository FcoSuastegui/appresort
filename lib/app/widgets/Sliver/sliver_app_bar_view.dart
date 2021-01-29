import 'package:appresort/app/themes/adapt.dart';
import 'package:flutter/material.dart';

class SliverAppBarView extends StatelessWidget {
  final Widget leading, title;
  final List<Widget> actions;

  const SliverAppBarView({
    Key key,
    this.leading,
    this.title,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = ThemeData();
    return Container(
      color: _theme.canvasColor,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Adapt.px(20),
          vertical: Adapt.px(10),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Adapt.px(10),
          horizontal: Adapt.px(20),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: _theme.brightness == Brightness.light
                ? const Color(0xFFEFEFEF)
                : const Color(0xFF505050),
          ),
          borderRadius: BorderRadius.circular(
            Adapt.px(20),
          ),
          color: _theme.cardColor,
        ),
        child: Row(
          children: [
            leading != null ? Expanded(child: leading) : SizedBox(width: 10),
            title != null ? Expanded(child: title) : SizedBox(width: 10),
            Expanded(
              child: actions != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: getActions(actions))
                  : SizedBox(width: 10),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getActions(List<Widget> actions) {
    List<Widget> childs = [];
    actions.forEach((element) {
      childs.add(Expanded(child: element));
    });
    return childs;
  }
}
