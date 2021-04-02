import 'package:appresort/app/data/models/select_model.dart';
import 'package:appresort/app/data/services/areas.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/validators_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:rxdart/subjects.dart';

class ReservationAddBloc extends FormBloc<String, String> {
  final String date;
  final int weekend;

  // Elementos fuera del form
  BehaviorSubject<int> _ocupacionMax = BehaviorSubject<int>();

  Function(int) get addOcupacionMax => _ocupacionMax.sink.add;
  Stream<int> get getOcupacionMax => _ocupacionMax.stream;

  List<SelectModel> listAreas = List<SelectModel>();
  List<SelectModel> listHorarios = List<SelectModel>();
  List<SelectModel> listUnidades = List<SelectModel>();

  // Elementos del form
  final numeroPersonas = TextFieldBloc(
    initialValue: '1',
    validators: [ValidatorsBloc.required],
  );
  final comentarios = TextFieldBloc();
  final areas = SelectFieldBloc<String, Object>(
    items: [],
  );
  final horarios = SelectFieldBloc<String, Object>(
    items: [],
  );

  final unidades = SelectFieldBloc<String, Object>(
    items: [],
  );

  ReservationAddBloc({@required this.date, @required this.weekend}) {
    getAreas();
    getUnidades();
    addFieldBlocs(
      fieldBlocs: [numeroPersonas, areas, horarios, comentarios, unidades],
    );
  }

  @override
  Future<void> close() {
    numeroPersonas?.close();
    comentarios?.close();
    areas?.close();
    horarios?.close();
    unidades?.close();
    _ocupacionMax?.close();
    return super.close();
  }

  void failure(String message) {
    emitFailure(
      failureResponse: message,
    );
  }

  @override
  void onSubmitting() async {
    if (unidades.value == null) {
      failure('Seleccione una unidad');
      return;
    }
    if (areas.value == null) {
      failure('Seleccione una área');
      return;
    }
    if (horarios.value == null) {
      failure('Seleccione una horario');
      return;
    }

    if (numeroPersonas.valueToInt > _ocupacionMax.value) {
      failure('El máximo de persona es ${_ocupacionMax.value}');
      return;
    }

    final Map<String, dynamic> datos = {
      'iddesarrollo': GetStorages.i.user.iddesarrollo,
      'idarea': listAreas.where((element) => element.name == areas.value).first.id,
      'idhorario': listHorarios.where((element) => element.name == horarios.value).first.id,
      'unidad': listUnidades.where((element) => element.name == unidades.value).first.id,
      'cantidad': numeroPersonas.valueToInt,
      'descripcion': comentarios.value,
      'fecha': date,
    };

    final response = await Areas.addReservation(datos);
    response.status
        ? emitSuccess(successResponse: response.message)
        : emitFailure(failureResponse: response.message);
  }

  Future<void> getAreas() async {
    listAreas = await Areas.listAreas(
      desarrollo: int.parse(GetStorages.i.user.iddesarrollo),
    );
    final items = listAreas.map((e) => e.name).toList();
    areas.updateItems(items);
    if (items.length > 0) {
      areas.updateInitialValue(items.first);
    }
    addOcupacionMax(0);
  }

  Future<void> getUnidades() async {
    listUnidades = await Areas.listUnidades(
      idpropietario: int.parse(GetStorages.i.user.idpropietario),
    );
    final items = listUnidades.map((e) => e.name).toList();
    unidades.updateItems(items);
    if (items.length > 0) {
      unidades.updateInitialValue(items.first);
    }
  }

  Future<void> getHorarios(String name) async {
    addOcupacionMax(0);
    int idArea = listAreas.where((element) => element.name == name).first.id;
    listHorarios = await Areas.listHorarios(
      idarea: idArea,
      finSemana: weekend,
    );
    final items = listHorarios.map((e) => e.name).toList();
    horarios.updateItems(items);
    if (items.length > 0) {
      horarios.updateInitialValue(items.first);
      cupoDisponible(items.first);
    }
  }

  Future<void> cupoDisponible(String name) async {
    int idHorario = listHorarios.where((element) => element.name == name).first.id;
    final ocupacion = await Areas.validarCupo(date, idHorario);
    addOcupacionMax(ocupacion);
  }
}
