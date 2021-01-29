import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/conekta/oxxo-pay/oxxo_pay_view.dart';
import 'package:appresort/app/views/conekta/payment/payment_view.dart';
import 'package:appresort/app/views/listar-cargos/bindings/listar_cargos_binding.dart';
import 'package:appresort/app/views/listar-cargos/listar_cargos_view.dart';
import 'package:appresort/app/views/login/login_view.dart';
import 'package:appresort/app/views/nav_bar/nav_bar_view.dart';
import 'package:appresort/app/views/notification/notification_content_view.dart';
import 'package:appresort/app/views/onboarding/bindings/onboarding_binding.dart';
import 'package:appresort/app/views/onboarding/onboarding_view.dart';
import 'package:appresort/app/views/password/password_view.dart';
import 'package:appresort/app/views/profile/binding/profile_binding.dart';
import 'package:appresort/app/views/profile/profile_view.dart';
import 'package:appresort/app/views/publicacion/binding/publicacion_binding.dart';
import 'package:appresort/app/views/publicacion/publicacion_view.dart';
import 'package:appresort/app/views/reglamento/bindings/reglamento_binding.dart';
import 'package:appresort/app/views/reglamento/reglamento_view.dart';
import 'package:appresort/app/views/saldos/bindings/saldos_binding.dart';
import 'package:appresort/app/views/saldos/saldos_view.dart';
import 'package:appresort/app/views/services/services_view.dart';
import 'package:appresort/app/views/tickets/bindings/ticket_binding.dart';
import 'package:appresort/app/views/tickets/ticket_add_view.dart';
import 'package:appresort/app/views/tickets/ticket_view.dart';
import 'package:get/get.dart';

class Routes {
  static final Routes _instancia = new Routes._internal();
  factory Routes() => _instancia;
  Routes._internal();

  static final List<GetPage> routes = [
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
      name: NavBarView.routeName,
      page: () => NavBarView(),
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
      binding: ProfileBinding(),
    ),
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
    GetPage(
      name: PublicacionView.routeName,
      page: () => PublicacionView(),
      binding: PublicacionBinding(),
    ),
    GetPage(
      name: NotificationContentView.routeName,
      page: () => NotificationContentView(),
      fullscreenDialog: true,
    ),
  ];

  static goToPage(String page, {dynamic arguments}) {
    routes.any((e) => e.name == page)
        ? Get.toNamed(
            page,
            arguments: arguments,
          )
        : Helper.error(
            message: "El módulo no esta disponible o no tienes acceso a ello.",
          );
  }
}
