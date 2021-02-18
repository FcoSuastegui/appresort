import 'package:appresort/app/data/models/charges_model.dart';
import 'package:appresort/app/data/services/balance_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagoLineaController extends GetxController {
  static const _pageSize = 10;
  final pagingController = PagingController<int, ChargesModel>(
    firstPageKey: 1,
  );

  ChargesModel charge;
  void select(ChargesModel v) => charge = v;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getCharges(pageKey);
    });
    super.onInit();
  }

  Future<void> getCharges(int pageKey) async {
    final list = await BalanceService.getCharges(
      idpropietario: int.parse(GetStorages.i.user.idpropietario),
      page: pageKey,
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
}
