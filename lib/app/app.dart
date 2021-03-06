import 'package:appresort/app/globals/bindings/global_binding.dart';
import 'package:appresort/app/globals/controller/router_observer.dart';
import 'package:appresort/app/shared/logger/logger_utils.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/app_theme_data.dart';
import 'package:appresort/app/utils/i18.dart';
import 'package:appresort/app/widgets/version/version.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    NewVersion(
      context: context,
      iOSId: 'app.resort.apleeks.com',
      androidId: 'com.apleeks.resort.app',
    ).showAlertIfNecessary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppThemeData.init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GetMaterialApp(
        title: "App Resort",
        debugShowCheckedModeBanner: false,
        initialRoute: GetStorages.i.validarToken(),
        defaultTransition: Transition.fadeIn,
        getPages: Routes.routes,
        theme: AppThemeData.lightTheme,
        locale: Locale('es'),
        initialBinding: GlobalBinding(),
        navigatorObservers: [MyRouteObserver()],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supporteLocate) => supporteLocate.first,
        supportedLocales: [
          const Locale('es'), // Español
          const Locale('en'), // English
        ],
        translations: I18(),
        enableLog: true,
        logWriterCallback: Logger.write,
      ),
    );
  }
}
