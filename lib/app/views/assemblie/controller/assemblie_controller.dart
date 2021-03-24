import 'package:appresort/app/data/models/assemblie_model.dart';
import 'package:appresort/app/data/services/assemblie_service.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AssemblieController extends GetxController {
  static const _pageSize = 10;

  final pagingController = PagingController<int, AssemblieModel>(
    firstPageKey: 1,
  );

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getAssemblies(pageKey);
    });
    super.onInit();
  }

  Future<void> getAssemblies(int pageKey) async {
    final list = await AssemblieService.getAssemblie(pageKey);
    list.message == null
        ? list.itemList.length <= _pageSize
            ? pagingController.appendLastPage(list.itemList)
            : pagingController.appendPage(list.itemList, ++pageKey)
        : pagingController.error = list.message;
  }
}
