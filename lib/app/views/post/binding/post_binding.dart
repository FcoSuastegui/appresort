import 'package:appresort/app/views/post/controller/post_controller.dart';
import 'package:get/get.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController.i);
  }
}
