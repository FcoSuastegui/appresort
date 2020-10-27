import 'package:appresort/app/app.dart';
import 'package:appresort/app/controller/firebase_controller.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorages.inst.init();
  await FireBaseController.inst.init();
  runApp(App());
}
