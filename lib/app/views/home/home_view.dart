import 'package:appresort/app/views/home/components/home_body.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:appresort/app/views/home/components/home_header.dart';

class HomeView extends StatelessWidget {
  static final String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: SliverScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    HomeBody(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
