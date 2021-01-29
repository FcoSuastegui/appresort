import 'package:appresort/app/app.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorages.i.init();
  runApp(App());
}
