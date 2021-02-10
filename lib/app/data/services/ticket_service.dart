import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/chat_model.dart';
import 'package:appresort/app/data/models/list_page.dart';
import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/data/models/tickets_model.dart';
import 'package:appresort/app/data/models/time_line_model.dart';

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

  static Future<ListPage<ChatModel>> ticketChat({
    int idTicket = 0,
    int idUser = 0,
    int page = 1,
  }) async {
    final response = await Network.i.post(
      route: '/app/ticketChat',
      data: {
        "id_ticket": idTicket,
        "id_user": idUser,
        "page": page,
      },
    );

    final List<ChatModel> list = List<ChatModel>();
    String message;
    response.status
        ? response.data.forEach((e) => list.add(ChatModel.fromJson(e)))
        : message = response.message;

    return ListPage<ChatModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<ListPage<TimeLineModel>> ticketTimeLine({
    int idTicket = 0,
    int page = 1,
  }) async {
    final response = await Network.i.post(
      route: '/app/ticketTimeLine',
      data: {
        "id_ticket": idTicket,
        "page": page,
      },
    );

    final List<TimeLineModel> list = List<TimeLineModel>();
    String message;
    response.status
        ? response.data.forEach((e) => list.add(TimeLineModel.fromJson(e)))
        : message = response.message;

    return ListPage<TimeLineModel>(
      itemList: list,
      totalCount: list.length,
      message: message,
    );
  }

  static Future<ResponseModel> ticketChatAdd({
    int idTicket = 0,
    int idUser = 0,
    String message,
  }) {
    return Network.i.post(
      route: '/app/ticketChatAdd',
      data: {
        "id_ticket": idTicket,
        "id_user": idUser,
        "message": message,
      },
    );
  }

  static Future<ResponseModel> catalogoTicket({int idpropietario, int sistema}) async {
    return Network.i.post(
      route: '/app/catalogosTickets',
      data: {"idpropietario": idpropietario, "sistema": sistema},
    );
  }

  static Future<ResponseModel> addTicket(Map<String, dynamic> data) async {
    return Network.i.postFormData(
      route: '/app/agregarTicket',
      data: data,
    );
  }
}
