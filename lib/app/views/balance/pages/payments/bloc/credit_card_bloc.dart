import 'dart:async';

import 'package:appresort/app/utils/validator_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CreditCardBloc extends FormBloc<String, String> {
  final double total;
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

  CreditCardBloc({@required this.pageViewController, @required this.total}) {
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
      await Future.delayed(const Duration(seconds: 1));
      pageViewController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      emitSuccess();
      message = "El pago aun no se ha procesado, se le notificara cuando se haya realizado el pago";
    } else {
      await Future.delayed(const Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
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
