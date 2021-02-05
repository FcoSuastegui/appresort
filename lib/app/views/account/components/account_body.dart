import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/views/account/components/account_header.dart';
import 'package:appresort/app/widgets/Alerts/alert_actions.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_default.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountBody extends StatelessWidget {
  const AccountBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: Adapt.px(20),
              horizontal: Adapt.px(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AccountHeader(),
                SizedBox(
                  height: Adapt.px(30),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTileCustom(
                        title: 'change-password'.tr,
                        iconPress: Icons.arrow_forward,
                        onPressed: () => Routes.goToPage('/password'),
                      ),
                      SizedBox(
                        height: Adapt.px(20),
                      ),
                      ListTileCustom(
                        title: 'logout'.tr,
                        iconPress: Icons.exit_to_app,
                        onPressed: () async => await logout(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> logout() async {
    await Get.dialog(
      AlertAction(
        title: "¿Deseas salir de la aplicación?",
        onPress: () async {
          await GetStorages.i.clear();
          GetStorages.i.onboarding = true;
          Get.offAllNamed('/');
        },
      ),
    );
  }
}
