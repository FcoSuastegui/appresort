import 'package:appresort/app/data/models/regulation_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/regulation/controller/regulation_controller.dart';
import 'package:appresort/app/views/regulation/regulation_content.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/ListTile/list_tile_custom.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RegulationView extends GetView<RegulationController> {
  static final String routeName = '/regulations';
  const RegulationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "regulations".tr,
        ),
      ),
      body: SliverScrollView(
        onRefresh: () => Future.sync(
          () => controller.pagingController.refresh(),
        ),
        slivers: [
          PagedSliverList.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<RegulationModel>(
              itemBuilder: (context, regulation, index) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Adapt.px(20),
                  vertical: Adapt.px(20),
                ),
                child: ListTileCustom(
                  backgroundicon: Colors.indigo,
                  title: regulation.nombre,
                  onPressed: () => Get.to(
                      RegulationContent(
                        path: regulation.ruta,
                      ),
                      fullscreenDialog: true),
                ),
              ),
              firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay reglamentos disponibles"),
              ),
              noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay reglamentos disponibles"),
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
