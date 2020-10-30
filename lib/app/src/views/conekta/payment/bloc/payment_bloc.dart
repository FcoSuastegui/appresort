import 'package:appresort/app/src/data/conekta/conekta_flutter_token.dart';
import 'package:appresort/app/src/data/conekta/conekta_model.dart';
import 'package:appresort/app/src/data/conekta/payment_model.dart';
import 'package:appresort/app/src/data/services/conekta_service.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:appresort/app/src/helpers/validators_bloc.dart';
import 'package:appresort/app/src/views/listar-cargos/controller/listar_cargos_controller.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class PaymentBloc extends FormBloc<String, String> {
  // Controllador que contiene servicio y datos del cargo
  final ListarCargosController controller = Get.find<ListarCargosController>();

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
  final celular = TextFieldBloc(validators: [
    ValidatorsBloc.required,
    ValidatorsBloc.numeroCelular,
  ]);

  // Datos de tarjeta
  final cardNumber = TextFieldBloc(
    validators: [
      ValidatorsBloc.required,
      ValidatorsBloc.validateCardNumber,
    ],
  );

  final mes = TextFieldBloc(
    validators: [
      ValidatorsBloc.required,
      ValidatorsBloc.monthFormate,
    ],
  );
  final anio = TextFieldBloc(
    validators: [
      ValidatorsBloc.required,
      ValidatorsBloc.yearFormate,
    ],
  );

  final cvc = TextFieldBloc(
    validators: [
      ValidatorsBloc.onlyNumber,
      ValidatorsBloc.validateCardCvv,
    ],
  );

  PaymentBloc() {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [nombreCompleto, correo, celular],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [cardNumber, mes, anio,  cvc],
    );
  }

  @override
  Future<void> close() {
    nombreCompleto?.close();
    correo?.close();
    celular?.close();
    cardNumber?.close();
    mes?.close();
    anio?.close();
    cvc?.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    if (state.currentStep == 0) {
      emitSuccess();
    } else {
      

      final ConektaModel token =
          await ConektaFlutterTokenizer().tokenizePaymentMethod(
        PaymentMethod(
          name: nombreCompleto.value,
          number: cardNumber.value,
          expirationMonth: mes.value,
          expirationYear: anio.value,
          cvc: cvc.value,
        ),
      );

      if (token.object == 'error') {
        emitFailure(
          failureResponse: token.messageToPurchaser,
        );
        return;
      }

      final response = await ConektaService.inst.payment(
        {
          "nombreCompleto": nombreCompleto.value,
          "celular": celular.value,
          "correo": correo.value,
          "idpropietario": GetStorages.inst.idpropietario,
          "idcargo": controller.cargoSeleccionado.idcargo,
          "total": controller.total,
          "token": token.id
        },
      );
      response.status
          ? emitSuccess(
              successResponse: response.message,
            )
          : emitFailure(
              failureResponse: response.message,
            );
    }
  }
}
