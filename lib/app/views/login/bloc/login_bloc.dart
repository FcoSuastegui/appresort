import 'package:appresort/app/controller/firebase_controller.dart';
import 'package:appresort/app/data/models/response_model.dart';
import 'package:appresort/app/data/models/user_model.dart';
import 'package:appresort/app/data/services/auth_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/validators_bloc.dart';
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
    final ResponseModel response = await AuthService.login(
      username: username.value.replaceAll(' ', ''),
      password: password.value,
    );

    if (response.status) {
      GetStorages.i.user = UserModel.fromJson(response.data);
      GetStorages.i.page = GetStorages.i.onboarding ? '/onboarding' : '/nav-bar';
      await FireBaseController.inst.init();
      emitSuccess();
    } else {
      emitFailure(failureResponse: response.message);
    }
  }
}
