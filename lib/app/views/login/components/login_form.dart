import 'package:appresort/app/globals/controller/one_signal_controller.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/widgets/FormField/input_text_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/views/login/bloc/login_bloc.dart';
import 'package:appresort/app/widgets/Animation/fade_animation.dart';
import 'package:appresort/app/widgets/Buttons/button_submit.dart';
import 'package:appresort/app/widgets/Informacion/informacion.dart';
import 'package:appresort/app/widgets/Loading/loading_apleeks.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          final login = BlocProvider.of<LoginBloc>(context);
          return FormBlocListener<LoginBloc, String, String>(
            onSubmitting: (context, state) => LoadingApleeks.show(context),
            onSuccess: (context, state) {
              LoadingApleeks.hide(context);
              login.close();
              Get.offAllNamed(GetStorages.i.page);
              OneSignalController.i.initPlatformState();
            },
            onFailure: (context, state) async {
              LoadingApleeks.hide(context);
              Helper.error(message: state.failureResponse);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                        InputTextCupertino(
                          textFieldBloc: login.username,
                          placeholder: 'Usuario',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        InputTextCupertino(
                          textFieldBloc: login.password,
                          placeholder: 'Contrase??a',
                          suffixButton: SuffixButton.obscureText,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Adapt.px(30),
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
                    "??Olvidaste tu contrase??a?",
                    style: TextStyle(
                      color: AppTheme.kTextColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
