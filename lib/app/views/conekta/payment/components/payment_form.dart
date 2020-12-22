import 'package:appresort/app/views/conekta/payment/bloc/payment_bloc.dart';
import 'package:appresort/app/widgets/Alerts/custom_alert.dart';
import 'package:appresort/app/widgets/Fields/input_text_field_bloc.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Builder(
        builder: (context) {
          final payment = context.bloc<PaymentBloc>();
          return FormBlocListener<PaymentBloc, String, String>(
            onSubmitting: (context, state) => LoadingDialog.show(context),
            onSuccess: (context, state) async {
              LoadingDialog.hide(context);
              if (state.stepCompleted == state.lastStep) {
                await Get.dialog(
                  CustomAlert(
                    text: state.successResponse,
                    type: AlertDialogType.SUCCESS,
                    action: () => Get.back(),
                  ),
                );
                Get.offAllNamed('/navigation-bar');
                payment.close();
              }
            },
            onFailure: (context, state) async {
              LoadingDialog.hide(context);
              await Get.dialog(
                CustomAlert(
                  text: state.failureResponse,
                  type: AlertDialogType.ERROR,
                  action: () => Get.back(),
                ),
              );
            },
            child: StepperFormBlocBuilder<PaymentBloc>(
              type: StepperType.horizontal,
              physics: ClampingScrollPhysics(),
              stepsBuilder: (formBloc) {
                return [
                  _personalStep(payment),
                  _tarjetaStep(payment),
                ];
              },
            ),
          );
        },
      ),
    );
  }

  FormBlocStep _personalStep(PaymentBloc bloc) {
    return FormBlocStep(
      title: Text('Datos Personales'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InputTextFieldBloc(
              textFieldBloc: bloc.nombreCompleto,
              labelText: "Nombre del titular",
            ),
            InputTextFieldBloc(
              textFieldBloc: bloc.correo,
              labelText: "Correo electrónico",
            ),
            InputTextFieldBloc(
              textFieldBloc: bloc.celular,
              labelText: "Número de celular",
              hintText: '741 2345 678',
              keyboardType: TextInputType.phone,
              inputFormatters: [MaskedInputFormater('### #### ###')],
            ),
          ],
        ),
      ),
    );
  }

  FormBlocStep _tarjetaStep(PaymentBloc bloc) {
    return FormBlocStep(
      title: Text('Pagar'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InputTextFieldBloc(
              textFieldBloc: bloc.cardNumber,
              labelText: "Número de tarjeta",
              hintText: 'xxxx xxxx xxxx xxxx',
              keyboardType: TextInputType.phone,
              inputFormatters: [
                MaskedInputFormater('#### #### #### ####'),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 20.0,
                top: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: InputTextFieldBloc(
                        textFieldBloc: bloc.expired,
                        labelText: "Fecha expiración",
                        hintText: "10/20",
                        inputFormatters: [
                          MaskedInputFormater('##/##'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InputTextFieldBloc(
                      textFieldBloc: bloc.cvc,
                      keyboardType: TextInputType.phone,
                      labelText: "CVV",
                      inputFormatters: [
                        MaskedInputFormater('###'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Total a pagar ${bloc.controller.total.toCurrencyString(
                    leadingSymbol: MoneyInputFormatter.DOLLAR_SIGN,
                  )}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
