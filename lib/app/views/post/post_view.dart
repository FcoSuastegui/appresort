import 'package:appresort/app/data/models/post_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/post/components/post_card.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appresort/app/widgets/Appbars/app_bar_default.dart';
import 'package:appresort/app/views/post/controller/post_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostView extends GetView<PostController> {
  static final String routeName = '/post';
  const PostView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: Text("Publicaciones"),
      ),
      body: SliverScrollView(
        onRefresh: () => Future.sync(
          () => controller.pagingController.refresh(),
        ),
        slivers: [
          PagedSliverList.separated(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<PostModel>(
              itemBuilder: (context, post, index) {
                GlobalKey postKey = GlobalKey(
                  debugLabel: index.toString(),
                );
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Adapt.px(10),
                    vertical: Adapt.px(10),
                  ),
                  child: PostItem(
                    post: post,
                    postKey: postKey,
                    onShared: () => controller.captureAndSharePng(key: postKey),
                  ),
                );
              },
              firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay publicaciones disponibles"),
              ),
              noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                title: Text("No hay publicaciones disponibles"),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: Adapt.px(10),
            ),
          ),
        ],
      ),
    );
  }
}
