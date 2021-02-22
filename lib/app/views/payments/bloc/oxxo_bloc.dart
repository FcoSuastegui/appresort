import 'package:appresort/app/data/services/conekta_service.dart';
import 'package:appresort/app/utils/validator_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'package:flutter/material.dart';

class OxxoBloc extends FormBloc<String, String> {
  final double total;
  final int charge, unidad, concepto, propietario;

  final PageController pageViewController;

  String message = '';
  final name = TextFieldBloc(
    validators: [
      ValidatorString.required,
    ],
  );
  final email = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.emailFormat,
    ],
  );
  final phone = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateCelPhoneFormate,
    ],
  );
  OxxoBloc({
    @required this.unidad,
    @required this.concepto,
    @required this.pageViewController,
    @required this.total,
    @required this.charge,
    @required this.propietario,
  }) {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [email, name, phone],
    );
    addFieldBlocs(
      step: 1,
      fieldBlocs: [email, name, phone],
    );
  }

  void back() {
    pageViewController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void onSubmitting() async {
    if (state.currentStep == 0) {
      final response = await ConektaService.oxxoPago({
        "name": name.value,
        "email": email.value,
        "phone": phone.value,
        "id_propietario": propietario,
        "id_charge": charge,
        "id_unidad": unidad,
        "id_concepto": concepto,
        "total": total,
      });

      if (response.status) {
        pageViewController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        emitSuccess();
        message = response.message;
      } else {
        emitFailure(failureResponse: response.message);
      }
    } else if (state.currentStep == 1) {
      emitSuccess();
    }
  }

  @override
  Future<void> close() {
    name.close();
    email.close();
    phone.close();
    return super.close();
  }
}
