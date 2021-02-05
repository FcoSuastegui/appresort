import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/conekta/oxxo-pay/oxxo_pay_view.dart';
import 'package:appresort/app/views/conekta/payment/payment_view.dart';
import 'package:appresort/app/views/listar-cargos/bindings/listar_cargos_binding.dart';
import 'package:appresort/app/views/listar-cargos/listar_cargos_view.dart';
import 'package:appresort/app/views/login/login_view.dart';
import 'package:appresort/app/views/nav_bar/nav_bar_view.dart';
import 'package:appresort/app/views/notification/notification_content_view.dart';
import 'package:appresort/app/views/notification/notification_view.dart';
import 'package:appresort/app/views/onboarding/bindings/onboarding_binding.dart';
import 'package:appresort/app/views/onboarding/onboarding_view.dart';
import 'package:appresort/app/views/password/password_view.dart';
import 'package:appresort/app/views/post/binding/post_binding.dart';
import 'package:appresort/app/views/post/post_view.dart';
import 'package:appresort/app/views/regulation/binding/regulation_binding.dart';
import 'package:appresort/app/views/regulation/regulation_view.dart';
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
      name: NotificationView.routeName,
      page: () => NotificationView(),
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
      name: RegulationView.routeName,
      page: () => RegulationView(),
      binding: RegulationBinding(),
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
      name: PostView.routeName,
      page: () => PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: NotificationContentView.routeName,
      page: () => NotificationContentView(),
      fullscreenDialog: true,
    ),
  ];

  static goToPage(String page, {dynamic arguments}) {
    print(page);
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
