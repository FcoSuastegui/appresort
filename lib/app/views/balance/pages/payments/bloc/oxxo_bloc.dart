import 'package:appresort/app/utils/validator_string.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'package:flutter/material.dart';

class OxxoBloc extends FormBloc<String, String> {
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
  OxxoBloc({@required this.pageViewController, @required this.total}) {
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
      await Future.delayed(const Duration(seconds: 1));
      pageViewController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      emitSuccess();
      message = "El pago aun no se ha procesado, se le notificara cuando se haya realizado el pago";
    } else if (state.currentStep == 1) {
      await Future.delayed(const Duration(seconds: 1));
      emitSuccess(canSubmitAgain: true);
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
