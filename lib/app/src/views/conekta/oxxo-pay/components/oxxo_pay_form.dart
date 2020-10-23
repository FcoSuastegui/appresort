import 'package:appresort/app/src/widgets/Alerts/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:appresort/app/src/helpers/formatters.dart';
import 'package:appresort/app/src/views/conekta/oxxo-pay/bloc/oxxo_bloc.dart';
import 'package:appresort/app/src/widgets/Buttons/button_submit_align.dart';
import 'package:appresort/app/src/widgets/Fields/input_text_field_bloc.dart';
import 'package:appresort/app/src/widgets/Loading/loading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OxxoPayForm extends StatelessWidget {
  const OxxoPayForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat moneda = NumberFormat.simpleCurrency();
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
                  inputFormatters: [
                    MaskedTextInputFormatter(
                      mask: 'xxx xxxx xxx',
                      separator: ' ',
                    ),
                  ],
                  hintText: "744 1234 567",
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10.0, top: 20.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Total a pagar ${moneda.format(oxxo.controller.total)}",
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
