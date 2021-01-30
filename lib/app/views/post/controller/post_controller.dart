import 'package:appresort/app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appresort/app/data/models/post_model.dart';
import 'package:appresort/app/data/services/post_service.dart';
import 'package:appresort/app/utils/get_storage.dart';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostController extends GetxController {
  PostController._internal();
  static PostController _instance = PostController._internal();
  static PostController get i => _instance;

  final pagingController = PagingController<int, PostModel>(
    firstPageKey: 1,
  );

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getPosts(pageKey);
    });
    super.onInit();
  }

  Future<void> getPosts(int pageKey) async {
    final response = await PostService.posts(
      idusuario: int.parse(GetStorages.i.user.id),
      sistema: int.parse(GetStorages.i.user.sistema),
    );

    if (response.message == null) {
      final previouslyFetchedItemsCount = pagingController.itemList?.length ?? 0;

      final isLastPage = response.isLastPage(previouslyFetchedItemsCount);

      if (isLastPage) {
        pagingController.appendLastPage(response.itemList);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(response.itemList, nextPageKey);
      }
    } else {
      pagingController.error = response.message;
    }
  }

  Future captureAndSharePng({GlobalKey key}) async {
    try {
      RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      await Share.file(
        'Publicaciones',
        'share_publicaciones.png',
        pngBytes,
        'image/png',
      );
    } catch (e) {
      Helper.error(message: e.toString());
    }
  }
}
