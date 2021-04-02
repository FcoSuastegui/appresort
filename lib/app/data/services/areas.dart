import 'package:appresort/app/data/domain/network.dart';
import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/data/models/select_model.dart';

class Areas {
  static Future<List<SelectModel>> listAreas({int desarrollo = 0, String buscar = ''}) async {
    List<SelectModel> areas = List<SelectModel>();
    final response = await Network.i.post(
      route: '/areas',
      data: {
        'desarrollo ': desarrollo,
        'buscar': buscar,
      },
    );
    if (response.status) {
      response.data.forEach((e) => areas.add(SelectModel.fromJson(e)));
    }
    return areas;
  }

  static Future<List<SelectModel>> listHorarios({
    int idarea = 0,
    String buscar = '',
    int finSemana = 0,
  }) async {
    List<SelectModel> horarios = List<SelectModel>();
    final response = await Network.i.post(
      route: '/areas/horarios',
      data: {
        'idarea': idarea,
        'buscar': buscar,
        'fin_semana': finSemana,
      },
    );
    if (response.status) {
      response.data.forEach((e) => horarios.add(SelectModel.fromJson(e)));
    }
    return horarios;
  }

  static Future<List<SelectModel>> listUnidades({
    int idpropietario = 0,
  }) async {
    List<SelectModel> unidades = List<SelectModel>();
    final response = await Network.i.post(
      route: '/areas/unidades',
      data: {
        'idpropietario': idpropietario,
      },
    );
    if (response.status) {
      response.data.forEach((e) => unidades.add(SelectModel.fromJson(e)));
    }
    return unidades;
  }

  static Future<int> validarCupo(String fecha, int idhorario) async {
    final response = await Network.i.post(
      route: '/areas/validarCupo',
      data: {
        'fehca': fecha,
        'idhorario': idhorario,
      },
    );

    return response.status ? response.data['cantidadTotal'] as int : 0;
  }

  static Future<ResponseModel> reservaciones(int idpropietario) async {
    return await Network.i.post(
      route: '/areas/reservaciones',
      data: {
        'idpropietario': idpropietario,
      },
    );
  }

  static Future<ResponseModel> addReservation(Map<String, dynamic> datos) async {
    return await Network.i.post(
      route: '/areas/agregarReservacion',
      data: datos,
    );
  }
}
