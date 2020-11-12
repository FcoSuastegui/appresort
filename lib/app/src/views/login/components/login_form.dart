import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:appresort/app/src/views/login/bloc/login_bloc.dart';
import 'package:appresort/app/src/widgets/Alerts/custom_alert.dart';
import 'package:appresort/app/src/widgets/Animation/fade_animation.dart';
import 'package:appresort/app/src/widgets/Buttons/button_submit.dart';
import 'package:appresort/app/src/widgets/Fields/input_text_field_bloc.dart';
import 'package:appresort/app/src/widgets/Informacion/informacion.dart';
import 'package:appresort/app/src/widgets/Loading/loading.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          final login = context.bloc<LoginBloc>();
          return FormBlocListener<LoginBloc, String, String>(
            onSubmitting: (context, state) => LoadingDialog.show(context),
            onSuccess: (context, state) {
              LoadingDialog.hide(context);
              login.close();
              Get.offAllNamed(GetStorages.inst.page);
            },
            onFailure: (context, state) async {
              LoadingDialog.hide(context);
              Get.dialog(
                CustomAlert(
                  type: AlertDialogType.ERROR,
                  text: state.failureResponse,
                ),
                barrierDismissible: true,
              );
            },
            child: Column(
              children: <Widget>[
                FadeAnimation(1, Informacion.logo),
                FadeAnimation(
                  1.4,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.transparent,
                          blurRadius: 50,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        InputTextFieldBloc(
                          textFieldBloc: login.username,
                          keyboardType: TextInputType.phone,
                          labelText: 'Usuario',
                          hintText: "744 1234 567",
                          inputFormatters: [
                            MaskedInputFormater('### #### ###')
                          ],
                        ),
                        InputTextFieldBloc(
                          suffixButton: SuffixButton.obscureText,
                          textFieldBloc: login.password,
                          labelText: "Contraseña",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FadeAnimation(
                  1.5,
                  ButtonSubmit(
                    submit: login.submit,
                    text: 'Acceder',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FadeAnimation(
                  1.5,
                  Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(
                      color: AppTheme.kTextColor,
                    ),
                  ),
                ),
                FadeAnimation(1, Informacion.footer),
              ],
            ),
          );
        },
      ),
    );
  }
}
