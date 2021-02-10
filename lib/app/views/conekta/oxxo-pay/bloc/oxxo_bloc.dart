import 'package:appresort/app/data/services/conekta_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/validators_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class OxxoBloc extends FormBloc<String, String> {
  //final ListarCargosController controller = Get.find<ListarCargosController>();

  // Datos generales
  final nombreCompleto = TextFieldBloc(
    validators: [ValidatorsBloc.required],
  );
  final correo = TextFieldBloc(
    validators: [
      ValidatorsBloc.required,
      ValidatorsBloc.emailFormat,
    ],
  );
  final celular = TextFieldBloc(
    validators: [ValidatorsBloc.required, ValidatorsBloc.numberFormate],
  );

  OxxoBloc() {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [nombreCompleto, correo, celular],
    );
  }

  @override
  Future<void> close() {
    nombreCompleto?.close();
    correo?.close();
    celular?.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    final response = await ConektaService.oxxoPago({
      "nombreCompleto": nombreCompleto.value,
      "correo": correo.value,
      "celular": celular.value.replaceAll(' ', ''),
      "idcargo": 1, //controller.cargoSeleccionado.idcargo,
      "idpropietario": GetStorages.i.user.idpropietario,
      "total": 0, //controller.total,
    });

    print(response.message);

    response.status
        ? emitSuccess(
            successResponse: response.message,
          )
        : emitFailure(
            failureResponse: response.message,
          );
  }
}
