import 'package:get/get.dart';

class NavBarController extends GetxController {
  NavBarController._internal();
  static NavBarController _instance = NavBarController._internal();
  static NavBarController get i => _instance;

  RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int v) => _currentIndex(v);

  @override
  void onInit() {
    super.onInit();
  }
}
