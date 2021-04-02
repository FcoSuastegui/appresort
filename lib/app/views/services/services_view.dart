import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<Map<String, dynamic>> services = [
  {
    "title": "Pago en línea",
    "icon": "payment",
    "page": "/pago-linea",
  },
  {
    "title": "Reservaciones de áreas comunes",
    "icon": "event",
    "page": "/reservation",
  }
];

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
              child: ListView.separated(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final item = services[index];
                  return ListTileCustom(
                    title: item['title'],
                    onPressed: () => Routes.goToPage(item['page']),
                    icon: MyIcons.name(
                      name: item['icon'],
                      color: Colors.white,
                    ),
                  );
                },
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
