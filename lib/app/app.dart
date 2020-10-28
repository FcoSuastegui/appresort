import 'package:appresort/app/controller/app_controller.dart';
import 'package:appresort/app/src/routes/routes.dart';
import 'package:appresort/app/src/themes/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController.inst,
      builder: (controller) => GetMaterialApp(
        title: "App Resort",
        debugShowCheckedModeBanner: false,
        initialRoute: controller.inicialRoute,
        defaultTransition: Transition.cupertino,
        getPages: Routes.inst.routes,
        theme: AppThemeData.themeData,
        locale: Locale('es'),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supporteLocate) =>
            supporteLocate.first,
        supportedLocales: [
          const Locale('es'), // Español
          const Locale('en'), // English
        ],
      ),
    );
  }
}
