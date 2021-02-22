import 'package:appresort/app/data/services/conekta_service.dart';
import 'package:appresort/app/utils/validator_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreditCardBloc extends FormBloc<String, String> {
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

  final cardNumber = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateCardNumber,
    ],
  );
  final expired = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateCardValidThru,
    ],
  );
  final cvv = TextFieldBloc(
    validators: [
      ValidatorString.required,
      ValidatorString.validateCardCvv,
    ],
  );

  CreditCardBloc({
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
      fieldBlocs: [cardNumber, expired, cvv],
    );
    addFieldBlocs(
      step: 2,
      fieldBlocs: [cardNumber, expired, cvv],
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
      await Future.delayed(const Duration(seconds: 1));
      pageViewController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      emitSuccess();
    } else if (state.currentStep == 1) {
      final expire = expired.value.split('/');

      final response = await ConektaService.creditCard({
        "name": name.value,
        "number": cardNumber.value,
        "month": expire[0],
        "year": expire[1],
        "cvv": cvv.value,
        "id_propietario": propietario,
        "id_charge": charge,
        "id_unidad": unidad,
        "id_concepto": concepto,
        "total": total,
        "email": email.value,
        "phone": phone.value,
      });

      if (response.status) {
        pageViewController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        emitSuccess();
        message =
            "El pago aun no se ha procesado, se le notificara cuando se haya realizado el pago";
      } else {
        print(response.error);
        emitFailure(failureResponse: response.message);
      }
    } else {
      emitSuccess();
    }
  }

  @override
  Future<void> close() {
    name.close();
    email.close();
    phone.close();
    cardNumber.close();
    expired.close();
    cvv.close();
    return super.close();
  }
}
