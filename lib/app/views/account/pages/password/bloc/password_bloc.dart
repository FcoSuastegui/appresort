import 'package:appresort/app/data/services/auth_service.dart';
import 'package:appresort/app/utils/get_storage.dart';
import 'package:appresort/app/utils/validators_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PasswordBloc extends FormBloc<String, String> {
  final password = TextFieldBloc(validators: [ValidatorsBloc.required]);
  final confirm = TextFieldBloc(validators: [ValidatorsBloc.required]);

  PasswordBloc() {
    addFieldBlocs(fieldBlocs: [password, confirm]);
    confirm
      ..addValidators([ValidatorsBloc.confirmPassword(password)])
      ..subscribeToFieldBlocs([password]);
  }

  @override
  Future<void> close() {
    password?.close();
    confirm?.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    final response = await AuthService.changePassword(
      idusuario: int.parse(GetStorages.i.user.id),
      password: password.value,
    );
    response.status
        ? emitSuccess(successResponse: response.message)
        : emitFailure(failureResponse: response.message);
  }
}
