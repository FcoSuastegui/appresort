import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/views/password/bloc/password_bloc.dart';
import 'package:appresort/app/widgets/Alerts/custom_alert.dart';
import 'package:appresort/app/widgets/Buttons/button_submit.dart';
import 'package:appresort/app/widgets/Fields/input_text_field_bloc.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: BlocProvider(
        create: (context) => PasswordBloc(),
        child: Builder(
          builder: (context) {
            final change = context.bloc<PasswordBloc>();
            return FormBlocListener<PasswordBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) async {
                LoadingDialog.hide(context);
                change.close();
                await GetStorages.i.clear();
                GetStorages.i.onboarding = false;
                await Get.dialog(
                  CustomAlert(
                    type: AlertDialogType.SUCCESS,
                    text: state.successResponse,
                    action: () => Get.offAllNamed('/'),
                  ),
                );
              },
              onFailure: (context, state) async {
                LoadingDialog.hide(context);
                await await Get.dialog(
                  CustomAlert(
                    type: AlertDialogType.ERROR,
                    text: state.failureResponse,
                    action: () => Get.back(),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InputTextFieldBloc(
                    textFieldBloc: change.password,
                    suffixButton: SuffixButton.obscureText,
                    labelText: 'Nueva Contrasena',
                  ),
                  InputTextFieldBloc(
                    suffixButton: SuffixButton.obscureText,
                    textFieldBloc: change.confirm,
                    labelText: 'Confirma Contrasena',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ButtonSubmit(
                    submit: change.submit,
                    text: "Cambiar",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
