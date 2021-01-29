import 'package:appresort/app/widgets/Alerts/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:appresort/app/views/conekta/oxxo-pay/bloc/oxxo_bloc.dart';
import 'package:appresort/app/widgets/Buttons/button_submit_align.dart';
import 'package:appresort/app/widgets/Fields/input_text_field_bloc.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';

class OxxoPayForm extends StatelessWidget {
  const OxxoPayForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OxxoBloc(),
      child: Builder(
        builder: (context) {
          final oxxo = context.bloc<OxxoBloc>();
          return FormBlocListener<OxxoBloc, String, String>(
            onSubmitting: (context, state) => LoadingDialog.show(context),
            onSuccess: (context, state) async {
              LoadingDialog.hide(context);
              await Get.dialog(
                CustomAlert(
                  type: AlertDialogType.SUCCESS,
                  text: state.successResponse,
                  action: () => Get.back(),
                ),
              );
              Get.offAllNamed('/navigation-bar');
              oxxo.close();
            },
            onFailure: (context, state) async {
              LoadingDialog.hide(context);
              await Get.dialog(
                CustomAlert(
                  type: AlertDialogType.ERROR,
                  text: state.failureResponse,
                  action: () => Get.back(),
                ),
              );
            },
            child: Column(
              children: <Widget>[
                InputTextFieldBloc(
                  textFieldBloc: oxxo.nombreCompleto,
                  labelText: 'Nombre Completo',
                  keyboardType: TextInputType.text,
                ),
                InputTextFieldBloc(
                  textFieldBloc: oxxo.correo,
                  labelText: "Correo electrónico",
                  keyboardType: TextInputType.emailAddress,
                ),
                InputTextFieldBloc(
                  textFieldBloc: oxxo.celular,
                  keyboardType: TextInputType.phone,
                  labelText: 'Número de celular',
                  hintText: "744 1234 567",
                  inputFormatters: [
                    MaskedInputFormater('### #### ###'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Total a pagar ${oxxo.controller.total.toCurrencyString(
                        leadingSymbol: MoneyInputFormatter.DOLLAR_SIGN,
                      )}",
                    ),
                  ),
                ),
                ButtonSubmitAlign(
                  text: "Continuar",
                  submit: oxxo.submit,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}