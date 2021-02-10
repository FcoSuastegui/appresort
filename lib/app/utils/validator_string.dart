import 'package:get/get_utils/get_utils.dart';

class ValidatorString {
  static final ValidatorString _validatorString = new ValidatorString._internal();
  factory ValidatorString() => _validatorString;
  ValidatorString._internal();

  static String required(String textField) =>
      (textField == null || textField.isEmpty) ? 'required'.tr : null;

  static String emailFormat(String email) =>
      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(email)
          ? null
          : 'email-format'.tr;

  static String validateUser(String text) =>
      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(text)
          ? null
          : RegExp(r'^\d{10}$').hasMatch(text)
              ? null
              : 'Número o correo no válido';

  static String validateCelPhoneFormate(String celphone) =>
      RegExp(r'^\d{3}\s\d{4}\s\d{3}$').hasMatch(celphone) ? null : 'Número de celular no válido';

  static String validateCelPhone(String celphone) =>
      RegExp(r'^\d{10}$').hasMatch(celphone) ? null : 'Número de celular no válido';

  static String staticOnlyNumber(String textField) =>
      RegExp(r'^[0-9]+$').hasMatch(textField) ? null : 'Sólo número';

  static String validateText(String textField) =>
      RegExp(r'^[a-zA-Z]').hasMatch(textField) ? null : 'Sólo texto';

  // Validaciones de número de tarjeta
  static String validateName(String textField) =>
      RegExp(r'^[a-zA-Z]').hasMatch(textField) ? null : 'Ingresa un nombre válido';

  static String validateContact(String textField) =>
      RegExp(r'^([0-9]+$)|(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(textField)
          ? null
          : 'Solo número de celular o correo eléctronico';

  static String validateCardNumber(String cardNumber) =>
      RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$')
              .hasMatch(cardNumber.replaceAll(RegExp(r'\s+\b|\b\s'), ''))
          ? null
          : 'Ingrese un número de tarjeta correcta';

  static String validateCardMonth(String textField) =>
      (textField.isNotEmpty && int.parse(textField) > 0 && int.parse(textField) < 13)
          ? null
          : 'Mes incorrecto';

  static String validateCardYear(String textField) =>
      (textField.isNotEmpty && int.parse(textField) > 2000 && int.parse(textField) < 2028)
          ? null
          : 'Año incorrecto';

  static String validateCardCvv(String textField) =>
      (textField.length == 3) ? null : 'CVV incorrecto';

  static String validateCardValidThru(String textField) =>
      RegExp(r'^(0[1-9]|1[0-2])\/([2-9][0-9])$').hasMatch(textField)
          ? null
          : 'ValidThru incorrecto';

  /* static Validator<String> minLength(TextFieldBloc textFieldBloc, int length) =>
      (String textField) => (textField.length < length)
          ? "El campo debe tener minimo $length caracteres"
          : null; */

  static String maxLength(String textField, int length) =>
      textField.length > length ? "El campo debe tener máximo $length caracteres" : null;

  static String maxLength8(String textField) =>
      textField.length > 8 ? "El campo debe tener máximo 8 caracteres" : null;
/*
  static Validator<String> confirmPassword(TextFieldBloc password) =>
      (String passwordConfirm) => (passwordConfirm != password.value)
          ? "Debe ser igual a la contraseña"
          : null; */
}
