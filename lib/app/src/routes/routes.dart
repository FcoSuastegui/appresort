import 'package:appresort/app/src/helpers/helpers.dart';
import 'package:appresort/app/src/views/conekta/oxxo-pay/oxxo_pay_view.dart';
import 'package:appresort/app/src/views/conekta/payment/payment_view.dart';
import 'package:appresort/app/src/views/listar-cargos/bindings/listar_cargos_binding.dart';
import 'package:appresort/app/src/views/listar-cargos/listar_cargos_view.dart';
import 'package:appresort/app/src/views/login/login_view.dart';
import 'package:appresort/app/src/views/navigation_bar/bindings/navigation_bar_binding.dart';
import 'package:appresort/app/src/views/navigation_bar/navigation_bar_view.dart';
import 'package:appresort/app/src/views/onboarding/bindings/onboarding_binding.dart';
import 'package:appresort/app/src/views/onboarding/onboarding_view.dart';
import 'package:appresort/app/src/views/reglamento/bindings/reglamento_binding.dart';
import 'package:appresort/app/src/views/reglamento/reglamento_view.dart';
import 'package:appresort/app/src/views/saldos/bindings/saldos_binding.dart';
import 'package:appresort/app/src/views/saldos/saldos_view.dart';
import 'package:get/get.dart';

class Routes {
  Routes._internal();
  static Routes _instance = Routes._internal();
  static Routes get inst => _instance;

  final List<GetPage> routes = [
    GetPage(
      name: LoginView.routeName,
      page: () => LoginView(),
    ),
    GetPage(
      name: OnBoardingView.routeName,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: NavigationBarView.routeName,
      page: () => NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: ReglamentoView.routeName,
      page: () => ReglamentoView(),
      binding: ReglamentoBindig(),
    ),
    GetPage(
      name: SaldosView.routeName,
      page: () => SaldosView(),
      binding: SaldoBinding(),
    ),
    GetPage(
      name: ListarCargosView.routeName,
      page: () => ListarCargosView(),
      binding: ListarCargosBinding(),
    ),
    GetPage(
      name: OxxoPayView.routeName,
      page: () => OxxoPayView(),
    ),
    GetPage(
      name: PaymentView.routeName,
      page: () => PaymentView(),
    ),
  ];

  void goToPage(String page) {
    List<String> pages = [
      LoginView.routeName,
      OnBoardingView.routeName,
      NavigationBarView.routeName,
      ReglamentoView.routeName,
      SaldosView.routeName,
      ListarCargosView.routeName,
      OxxoPayView.routeName,
      PaymentView.routeName,
    ];

    pages.contains(page)
        ? Get.toNamed(page)
        : Helpers.error(
            message: "El módulo no esta disponible o no tienes acceso a ello.",
          );
  }
}
