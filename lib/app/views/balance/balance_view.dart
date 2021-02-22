import 'package:appresort/app/data/models/balance_saldos_model.dart';
import 'package:appresort/app/data/models/last_transactions.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/my_icons.dart';
import 'package:appresort/app/views/balance/components/card_balance.dart';
import 'package:appresort/app/views/balance/components/card_last_transactions.dart';
import 'package:appresort/app/views/balance/controller/balance_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
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
            () => controller.refresh(),
          ),
          slivers: [
            PagedSliverList.separated(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<BalanceSaldoModel>(
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
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async {
                        Get.dialog(
                          ApleeksModal(),
                          barrierDismissible: false,
                          barrierColor: Colors.transparent.withOpacity(0.3),
                        );
                        /* LoadingDialog.show(context);
                    String file = await c.getBankStatement();
                    LoadingDialog.hide(context);
                    Get.to(
                      PdfViewer(path: file, title: 'Estado de cuenta'),
                      fullscreenDialog: true,
                    ); */
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIcons.name(name: "download_sharp"),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Text(
                                'Estado de cuenta',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: Adapt.px(25),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => Routes.goToPage("/pago-linea"),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIcons.name(name: "payment"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Pago en línea',
                              style: TextStyle(
                                fontSize: Adapt.px(25),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: Adapt.px(30),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Text(
                  "Ultimos 10 movimientos".toUpperCase(),
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.bold,
                    fontSize: Adapt.px(30),
                  ),
                ),
              ),
            ),
            PagedSliverList.separated(
              pagingController: controller.transactionsController,
              builderDelegate: PagedChildBuilderDelegate<LastTransations>(
                itemBuilder: (context, transaction, index) => CardLastTransactions(
                  transation: transaction,
                ),
                firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                  title: Text("Hubo un error al  cargar la información"),
                ),
                noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                  title: Text("No hay información disponibles"),
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
