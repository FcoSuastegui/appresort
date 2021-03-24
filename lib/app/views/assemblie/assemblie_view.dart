import 'package:appresort/app/data/models/assemblie_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/assemblie/controller/assemblie_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/PdfViewer/pdf_viewer.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AssemblieView extends GetView<AssemblieController> {
  static final String routeName = '/assemblies';
  const AssemblieView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "assemblies".tr,
        ),
      ),
      body: SliverScrollView(
        onRefresh: () => Future.sync(
          () => controller.pagingController.refresh(),
        ),
        slivers: [
          PagedSliverList.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<AssemblieModel>(
              itemBuilder: (context, asamblea, index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Adapt.px(20),
                  vertical: Adapt.px(20),
                ),
                child: ListTileCustom(
                  backgroundicon: Colors.indigo,
                  title: asamblea.nombre,
                  onPressed: () => Get.to(
                    PdfViewer(
                      path: asamblea.ruta,
                      title: asamblea.nombre,
                    ),
                    fullscreenDialog: true,
                  ),
                ),
              ),
              firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay asambleas disponibles"),
              ),
              noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay asambleas disponibles"),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: Adapt.px(0),
            ),
          ),
        ],
      ),
    );
  }
}
