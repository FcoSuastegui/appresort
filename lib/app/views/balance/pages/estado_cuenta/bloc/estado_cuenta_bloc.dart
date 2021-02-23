import 'package:appresort/app/data/services/balance_service.dart';
import 'package:appresort/app/utils/validator_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class EstadoCuentaBloc extends FormBloc<String, String> {
  bool isEstadoCuenta = true;
  String selectMonth = "Enero", selectYear = "2020", selectLastDay = "10 días";

  final int propietario;

  final selectOpcion = SelectFieldBloc<String, Object>(
    validators: [ValidatorString.required],
    items: [
      'Consultar estado de cuenta',
      'Consultar últimas movimientos',
    ],
  );

  // Consultar por meses

  final months = SelectFieldBloc<String, Object>(
    validators: [ValidatorString.required],
    items: [],
  );

  final years = SelectFieldBloc<String, Object>(
    validators: [ValidatorString.required],
    items: [],
  );

  // Consultar por dias
  final lastDays = SelectFieldBloc<String, Object>(
    validators: [ValidatorString.required],
    items: [],
  );

  EstadoCuentaBloc({@required this.propietario}) {
    addFieldBlocs(fieldBlocs: [selectOpcion]);

    years.updateItems(getAnios());
    months.updateItems(getMonth());
    lastDays.updateItems(getLastDays());

    months.onValueChanges(
      onData: (previous, current) async* {
        selectMonth = current.value;
      },
    );
    years.onValueChanges(
      onData: (previous, current) async* {
        selectYear = current.value;
      },
    );
    lastDays.onValueChanges(
      onData: (previous, current) async* {
        selectLastDay = current.value;
      },
    );

    selectOpcion.onValueChanges(onData: (previous, current) async* {});
    selectOpcion.onValueChanges(
      onData: (previous, current) async* {
        removeFieldBlocs(
          fieldBlocs: [
            lastDays,
            years,
            months,
          ],
        );

        if (current.value == 'Consultar estado de cuenta') {
          isEstadoCuenta = true;
          addFieldBlocs(
            fieldBlocs: [
              years,
              months,
            ],
          );
        } else if (current.value == 'Consultar últimas movimientos') {
          isEstadoCuenta = false;
          addFieldBlocs(
            fieldBlocs: [
              lastDays,
            ],
          );
        }
      },
    );
  }

  @override
  void onSubmitting() async {
    final response = await BalanceService.bankStatement(
      type: isEstadoCuenta ? 1 : 2,
      idPropietario: propietario,
      mes: month[selectMonth],
      anio: int.parse(selectYear),
      lastDay: day[selectLastDay],
    );

    response.isNotEmpty
        ? emitSuccess(canSubmitAgain: true, successResponse: response)
        : emitFailure(failureResponse: 'Hubo un error al cargar el pdf ');
  }

  @override
  Future<void> close() {
    selectOpcion.close();
    lastDays.close();
    years.close();
    months.close();
    return super.close();
  }

  final Map<String, int> day = {
    '10 días': 10,
    '30 días': 30,
    '90 días': 90,
  };
  final Map<String, int> month = {
    'Enero': 1,
    'Febrero': 2,
    'Marzo': 3,
    'Abril': 4,
    'Mayo': 5,
    'Junio': 6,
    'Julio': 7,
    'Agosto': 8,
    'Septiembre': 9,
    'Octubre': 10,
    'Noviembre': 11,
    'Diciembre': 12,
  };

  List<String> getLastDays() => ['10 días', '30 días', '90 días'];

  List<String> getMonth() => [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Mayo',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre',
      ];

  List<String> getAnios() {
    List<String> list = List<String>();
    final now = new DateTime.now();
    final formatter = new DateFormat("yyyy");
    int formattedDate = int.parse(formatter.format(now));

    for (int i = formattedDate; i >= 2015; i--) {
      list.add(i.toString());
    }
    return list;
  }
}
