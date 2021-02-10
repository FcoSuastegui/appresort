import 'package:appresort/app/data/models/balance_model.dart';
import 'package:appresort/app/data/services/balance_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class BalanceController extends GetxController {
  static const _pageSize = 10;
  final user = GetStorages.i.user;
  final pagingController = PagingController<int, BalanceModel>(
    firstPageKey: 1,
  );

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getBalance(pageKey);
    });
    super.onInit();
  }

  Future<void> getBalance(int pageKey) async {
    final list = await BalanceService.balance(
      int.parse(user.idpropietario),
    );

    if (list.message == null) {
      final isLastPage = list.itemList.length < _pageSize;
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

  Future<String> getBankStatement() async {
    String file = '';
    final response = await BalanceService.bankStatement(
      idpropietario: int.parse(user.idpropietario),
      sistema: int.parse(user.sistema),
    );
    if (response.status) {
      file = response.data;
    }
    return file;
  }
}
