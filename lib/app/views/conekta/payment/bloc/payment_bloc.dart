import 'package:appresort/app/data/conekta/conekta_flutter_token.dart';
import 'package:appresort/app/data/conekta/conekta_model.dart';
import 'package:appresort/app/data/conekta/payment_model.dart';
import 'package:appresort/app/data/services/conekta_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/validators_bloc.dart';
import 'package:appresort/app/views/listar-cargos/controller/listar_cargos_controller.dart';
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
    ValidatorsBloc.numberFormate,
  ]);

  // Datos de tarjeta
  final cardNumber = TextFieldBloc(
    validators: [
      ValidatorsBloc.required,
      ValidatorsBloc.cardNumberFormate,
    ],
  );

  final expired = TextFieldBloc(validators: [
    ValidatorsBloc.required,
    ValidatorsBloc.fechaExpiracion,
  ]);

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
      fieldBlocs: [cardNumber, expired, cvc],
    );
  }

  @override
  Future<void> close() {
    nombreCompleto?.close();
    correo?.close();
    celular?.close();
    cardNumber?.close();
    expired?.close();
    cvc?.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    if (state.currentStep == 0) {
      emitSuccess();
    } else {
      final expire = expired.value.split('/');

      final ConektaModel token = await ConektaFlutterTokenizer().tokenizePaymentMethod(
        PaymentMethod(
          name: nombreCompleto.value,
          number: cardNumber.value,
          expirationMonth: expire[0],
          expirationYear: expire[1],
          cvc: cvc.value,
        ),
      );

      if (token.object == 'error') {
        emitFailure(
          failureResponse: token.messageToPurchaser,
        );
        return;
      }

      final response = await ConektaService.payment(
        {
          "nombreCompleto": nombreCompleto.value,
          "celular": celular.value,
          "correo": correo.value,
          "idpropietario": GetStorages.i.user.idpropietario,
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
