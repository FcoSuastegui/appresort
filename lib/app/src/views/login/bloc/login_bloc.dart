import 'package:appresort/app/controller/firebase_controller.dart';
import 'package:appresort/app/src/data/models/response_model.dart';
import 'package:appresort/app/src/data/models/user_model.dart';
import 'package:appresort/app/src/data/services/auth_service.dart';
import 'package:appresort/app/src/helpers/get_storage.dart';
import 'package:appresort/app/src/helpers/validators_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginBloc extends FormBloc<String, String> {
  final username = TextFieldBloc(
    validators: [
      ValidatorsBloc.required,
      ValidatorsBloc.numberFormate,
    ],
  );
  final password = TextFieldBloc(
    validators: [ValidatorsBloc.required],
  );

  LoginBloc() {
    addFieldBlocs(fieldBlocs: [username, password]);
  }

  @override
  Future<void> close() {
    username?.close();
    password?.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    final ResponseModel response = await AuthService.inst.login(
      username: username.value.replaceAll(' ', ''),
      password: password.value,
    );

    if (response.status) {
      final UserModel user = UserModel.fromJson(response.data);
      GetStorages.inst.token = user.token;
      GetStorages.inst.idusuario = user.id;
      GetStorages.inst.usuario = user.usuario;
      GetStorages.inst.nombreCompleto = user.nombreCompleto;
      GetStorages.inst.nombre = user.nombre;
      GetStorages.inst.avatar = user.photo;
      GetStorages.inst.correo = user.correo;
      GetStorages.inst.idpropietario = user.idpropietario;
      GetStorages.inst.sistema = user.sistema;
      GetStorages.inst.page =
          GetStorages.inst.onboarding ? '/onboarding' : '/navigation-bar';
      await FireBaseController.inst.init();
      emitSuccess();
    } else {
      emitFailure(failureResponse: response.message);
    }
  }
}
