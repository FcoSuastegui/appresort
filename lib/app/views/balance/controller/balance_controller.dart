import 'package:appresort/app/data/models/balance_saldos_model.dart';
import 'package:appresort/app/data/models/last_transactions.dart';
import 'package:appresort/app/data/services/balance_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BalanceController extends GetxController {
  static const _pageSize = 10;
  final user = GetStorages.i.user;
  final pagingController = PagingController<int, BalanceSaldoModel>(
    firstPageKey: 1,
  );

  final transactionsController = PagingController<int, LastTransations>(
    firstPageKey: 1,
  );

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getBalance(pageKey);
    });
    transactionsController.addPageRequestListener((pageKey) {
      lastTransactions(pageKey);
    });
    super.onInit();
  }

  Future<void> getBalance(int pageKey) async {
    final list = await BalanceService.balance(
      int.parse(user.idpropietario),
    );

    if (list.message == null) {
      final isLastPage = list.itemList.length <= _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(list.itemList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(list.itemList, nextPageKey);
      }
    } else {
      pagingController.error = list.message;
    }
  }

  Future<void> lastTransactions(int pageKey) async {
    final list = await BalanceService.lastTransactions(
      int.parse(user.idpropietario),
    );
    if (list.message == null) {
      final isLastPage = list.itemList.length <= _pageSize;
      if (isLastPage) {
        transactionsController.appendLastPage(list.itemList);
      } else {
        final nextPageKey = pageKey + 1;
        transactionsController.appendPage(list.itemList, nextPageKey);
      }
    } else {
      transactionsController.error = list.message;
    }
  }

  Future<void> refresh() async {
    pagingController.refresh();
    transactionsController.refresh();
  }

  Future<String> getBankStatement() async {
    String file = await BalanceService.bankStatement(
      idPropietario: int.parse(user.idpropietario),
      mes: 12,
      anio: 2020,
      type: 1,
    );
    return file;
  }
}
