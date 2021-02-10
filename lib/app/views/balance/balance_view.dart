import 'package:appresort/app/data/models/balance_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/views/balance/controller/balance_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BalanceView extends GetView<BalanceController> {
  static final String routeName = '/balance';
  const BalanceView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'balances'.tr,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: SliverScrollView(
          onRefresh: () => Future.sync(
            () => controller.pagingController.refresh(),
          ),
          slivers: [
            PagedSliverList.separated(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<BalanceModel>(
                itemBuilder: (context, balance, index) => CardBalance(
                  balance: balance,
                ),
                firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                  title: Text("Hubo un error al cargar la información"),
                ),
                noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                  title: Text("No hay informcación disponibles"),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: Adapt.px(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardBalance extends StatelessWidget {
  final BalanceModel balance;
  const CardBalance({
    Key key,
    this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<BalanceController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 70.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: 'Saldo actual: ',
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: '${balance.saldo}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: RichText(
                            text: TextSpan(
                              text: 'Cuota de mantenimiento: ',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${balance.cuotaord}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          subtitle: RichText(
                            text: TextSpan(
                              text: 'Cuota extraordinaria: ',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${balance.cuotaext}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Adapt.px(150),
              width: Adapt.px(150),
              child: CircleAvatar(
                backgroundColor: AppTheme.kPrimaryColor,
                child: Center(
                  child: MyIcons.name(
                    name: 'balance_scale',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        ListTileCustom(
          icon: MyIcons.name(
            name: 'download_sharp',
            color: Colors.white,
          ),
          title: 'Estado de cuenta',
          onPressed: () async {
            LoadingDialog.show(context);
            String file = await c.getBankStatement();
            LoadingDialog.hide(context);

            Helper.launchInBrowser(file);
          },
        ),
        SizedBox(
          height: 10,
        ),
        ListTileCustom(
          icon: MyIcons.name(
            name: 'payment',
            color: Colors.white,
          ),
          title: 'Pago en línea',
        ),
        SizedBox(
          height: 10,
        ),
        ListTileCustom(
          icon: MyIcons.name(
            name: 'work',
            color: Colors.white,
          ),
          title: 'Recibos de pagos',
        ),
      ],
    );
  }
}
