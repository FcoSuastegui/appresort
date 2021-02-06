import 'package:appresort/app/widgets/ScrollBar/scroll_bar_view.dart';
import 'package:flutter/material.dart';

class SliverScrollView extends StatelessWidget {
  final Function onRefresh;
  final List<Widget> slivers;
  final ScrollController controller;

  const SliverScrollView({
    Key key,
    this.onRefresh,
    this.slivers = const <Widget>[],
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollBarView(
      child: RefreshIndicator(
        strokeWidth: 1.0,
        onRefresh: onRefresh ?? () => Future.sync(() {}),
        child: CustomScrollView(
          controller: controller,
          slivers: slivers,
        ),
      ),
    );
  }
}
