import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesView extends StatelessWidget {
  static final String routeName = '/services';
  const ServicesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "services".tr,
        ),
      ),
      body: SliverScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: Adapt.px(20),
                horizontal: Adapt.px(20),
              ),
              child: ListView(
                padding: EdgeInsets.only(top: 0.0),
                shrinkWrap: true,
                children: [
                  ListTileCustom(
                    title: 'Pago en línea',
                    icon: MyIcons.name(
                      name: 'payment',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
