import 'package:appresort/app/widgets/ScrollBar/scroll_bar_view.dart';
import 'package:flutter/material.dart';

class SliverScrollView extends StatelessWidget {
  final Function onRefresh;
  final List<Widget> slivers;
  final ScrollController controller;
  final bool reverse;
  final ScrollPhysics physics;

  const SliverScrollView({
    Key key,
    this.onRefresh,
    this.slivers = const <Widget>[],
    this.controller,
    this.reverse = false,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollBarView(
      child: RefreshIndicator(
        strokeWidth: 1.0,
        onRefresh: onRefresh ?? () => Future.sync(() {}),
        child: CustomScrollView(
          physics: physics,
          reverse: reverse,
          controller: controller,
          slivers: slivers,
        ),
      ),
    );
  }
}
