import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';

class TicketService {
  static Future<ResponseModel> tickets({int idpropietario, int sistema}) async {
    return Network.i.post(
      route: '/app/tickets',
      data: {"idpropietario": idpropietario, "sistema": sistema},
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
