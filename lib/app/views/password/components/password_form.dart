import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/password/bloc/password_bloc.dart';
import 'package:appresort/app/widgets/Alerts/custom_alert.dart';
import 'package:appresort/app/widgets/Buttons/button_submit.dart';
import 'package:appresort/app/widgets/Loading/loading.dart';
import 'package:appresort/app/widgets/TextField/input_text_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordBloc(),
      child: Builder(
        builder: (context) {
          final change = BlocProvider.of<PasswordBloc>(context);
          return FormBlocListener<PasswordBloc, String, String>(
            onSubmitting: (context, state) => LoadingDialog.show(context),
            onSuccess: (context, state) async {
              LoadingDialog.hide(context);
              change.close();
              await GetStorages.i.clear();
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
              Helper.error(message: state.failureResponse);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                InputTextCupertino(
                  textFieldBloc: change.password,
                  placeholder: 'Nueva contraseña',
                  suffixButton: SuffixButton.obscureText,
                ),
                InputTextCupertino(
                  textFieldBloc: change.confirm,
                  placeholder: 'Repetir Contrasena',
                  suffixButton: SuffixButton.obscureText,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonSubmit(
                  submit: change.submit,
                  text: "change-password".tr,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
