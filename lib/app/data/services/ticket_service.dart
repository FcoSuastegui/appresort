import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/list_page.dart';
import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/data/models/tickets_model.dart';

class TicketService {
  static Future<ListPage<TicketsModel>> tickets({
    int idpropietario = 0,
    int sistema = 0,
    int page = 1,
  }) async {
    final response = await Network.i.post(
      route: '/app/tickets',
      data: {
        "idpropietario": idpropietario,
        "sistema": sistema,
        "page": page,
      },
    );

    final List<TicketsModel> list = List<TicketsModel>();
    String message;
    response.status
        ? response.data.forEach((e) => list.add(TicketsModel.fromJson(e)))
        : message = response.message;

    return ListPage<TicketsModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<ResponseModel> catalogoTicket({int idpropietario, int sistema}) async {
    return Network.i.post(
      route: '/app/catalogosTickets',
      data: {"idpropietario": idpropietario, "sistema": sistema},
    );
  }

  static Future<ResponseModel> addTicket(Map<String, dynamic> data) async {
    return Network.i.post(
      route: '/app/agregarTicket',
      data: data,
    );
  }
}
