import 'package:appresort/app/data/models/regulation_model.dart';
import 'package:appresort/app/data/services/helper_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RegulationController extends GetxController {
  static const _pageSize = 10;

  final pagingController = PagingController<int, RegulationModel>(
    firstPageKey: 1,
  );

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getRegulations(pageKey);
    });
    super.onInit();
  }

  Future<void> getRegulations(int pageKey) async {
    final list = await HelperService.reglamentos(
      desarrollo: int.parse(GetStorages.i.user.iddesarrollo),
      page: pageKey,
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
}
