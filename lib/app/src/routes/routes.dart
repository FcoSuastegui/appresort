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
import 'package:appresort/app/src/views/password/password_view.dart';
import 'package:appresort/app/src/views/profile/binding/profile_binding.dart';
import 'package:appresort/app/src/views/profile/profile_view.dart';
import 'package:appresort/app/src/views/publicacion/binding/publicacion_binding.dart';
import 'package:appresort/app/src/views/publicacion/publicacion_view.dart';
import 'package:appresort/app/src/views/reglamento/bindings/reglamento_binding.dart';
import 'package:appresort/app/src/views/reglamento/reglamento_view.dart';
import 'package:appresort/app/src/views/saldos/bindings/saldos_binding.dart';
import 'package:appresort/app/src/views/saldos/saldos_view.dart';
import 'package:appresort/app/src/views/services/services_view.dart';
import 'package:appresort/app/src/views/tickets/bindings/ticket_binding.dart';
import 'package:appresort/app/src/views/tickets/ticket_add_view.dart';
import 'package:appresort/app/src/views/tickets/ticket_view.dart';
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
    GetPage(
        name: ProfileView.routeName,
        page: () => ProfileView(),
        binding: ProfileBinding()),
    GetPage(
      name: PassWordView.routeName,
      page: () => PassWordView(),
    ),
    GetPage(
      name: ServicesView.routeName,
      page: () => ServicesView(),
    ),
    GetPage(
      name: TicketView.routeName,
      page: () => TicketView(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: TicketAddView.routeName,
      page: () => TicketAddView(),
    ),
    GetPage(
      name: PublicacionView.routeName,
      page: () => PublicacionView(),
      binding: PublicacionBinding(),
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
      ProfileView.routeName,
      PassWordView.routeName,
      ServicesView.routeName,
      TicketView.routeName,
      TicketAddView.routeName,
      PublicacionView.routeName,
    ];

    pages.contains(page)
        ? Get.toNamed(page)
        : Helpers.error(
            message: "El módulo no esta disponible o no tienes acceso a ello.",
          );
  }
}
