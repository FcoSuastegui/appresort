import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/balance/balance_view.dart';
import 'package:appresort/app/views/balance/binding/balance_binding.dart';
import 'package:appresort/app/views/balance/pages/pago_linea/binding/pago_linea_binding.dart';
import 'package:appresort/app/views/balance/pages/pago_linea/pago_linea_view.dart';
import 'package:appresort/app/views/balance/pages/payments/payments_view.dart';
import 'package:appresort/app/views/login/login_view.dart';
import 'package:appresort/app/views/nav_bar/nav_bar_view.dart';
import 'package:appresort/app/views/notification/notification_content_view.dart';
import 'package:appresort/app/views/notification/notification_view.dart';
import 'package:appresort/app/views/onboarding/bindings/onboarding_binding.dart';
import 'package:appresort/app/views/onboarding/onboarding_view.dart';
import 'package:appresort/app/views/account/pages/password/password_view.dart';
import 'package:appresort/app/views/post/binding/post_binding.dart';
import 'package:appresort/app/views/post/post_view.dart';
import 'package:appresort/app/views/regulation/binding/regulation_binding.dart';
import 'package:appresort/app/views/regulation/regulation_view.dart';
import 'package:appresort/app/views/services/services_view.dart';
import 'package:appresort/app/views/tickets/bindings/ticket_binding.dart';
import 'package:appresort/app/views/tickets/pages/chat/binding/ticket_chat_binding.dart';
import 'package:appresort/app/views/tickets/pages/ticket_add/ticket_add_view.dart';
import 'package:appresort/app/views/tickets/pages/chat/ticket_chat_view.dart';
import 'package:appresort/app/views/tickets/pages/ticket_content/binding/ticket_content_binding.dart';
import 'package:appresort/app/views/tickets/pages/ticket_content/ticket_content_view.dart';
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
      name: BalanceView.routeName,
      page: () => BalanceView(),
      binding: BalanceBinding(),
    ),
    GetPage(
      name: PagoLineaView.routeName,
      page: () => PagoLineaView(),
      binding: PagoLineaBinding(),
    ),
    GetPage(
      name: PaymentsView.routeName,
      page: () => PaymentsView(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: PassWordView.routeName,
      page: () => PassWordView(),
      fullscreenDialog: true,
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
      fullscreenDialog: true,
    ),
    GetPage(
      name: TicketContentView.routeName,
      page: () => TicketContentView(),
      binding: TicketContentBinding(),
    ),
    GetPage(
      name: TicketChatView.routeName,
      page: () => TicketChatView(),
      binding: TicketChatBinding(),
      fullscreenDialog: true,
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
