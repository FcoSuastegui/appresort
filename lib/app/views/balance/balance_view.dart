import 'package:appresort/app/data/models/balance_saldos_model.dart';
import 'package:appresort/app/data/models/last_transactions.dart';
import 'package:appresort/app/themes/adapt.dart';
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
              child: SizedBox(
                height: Adapt.px(30),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Text(
                  "Ultimos movimientos".toUpperCase(),
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
