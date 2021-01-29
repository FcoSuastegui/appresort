import 'package:appresort/app/widgets/ScrollBar/scroll_bar_view.dart';
import 'package:appresort/app/widgets/Sliver/sliver_app_bar_delegate.dart';
import 'package:flutter/material.dart';

class SliverScrollAppBar extends StatelessWidget {
  final Widget sliverAppBar;
  final bool floating, pinned;
  final double minHeight, maxHeight;
  final Function onRefresh;
  final List<Widget> slivers;
  final ScrollController controller;

  const SliverScrollAppBar({
    Key key,
    @required this.sliverAppBar,
    this.floating = true,
    this.pinned = false,
    this.minHeight = 100,
    this.maxHeight = 100,
    this.onRefresh,
    this.slivers = const <Widget>[],
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollBarView(
      child: RefreshIndicator(
        strokeWidth: 1.0,
        onRefresh: onRefresh ?? onReFreshNull,
        child: CustomScrollView(
          controller: controller,
          slivers: getSlivers(
            slivers,
            SliverPersistentHeader(
              floating: floating,
              pinned: pinned,
              delegate: SliverAppBarDelegate(
                minHeight: minHeight,
                maxHeight: minHeight,
                child: sliverAppBar,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onReFreshNull() async {}

  List<Widget> getSlivers(List<Widget> slivers, Widget widget) {
    List<Widget> childs = [widget];
    slivers.forEach((e) => childs.add(e));
    return childs;
  }
}
