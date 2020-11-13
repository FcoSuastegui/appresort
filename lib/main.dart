import 'package:appresort/app/app.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorages.inst.init();
  runApp(App());
}