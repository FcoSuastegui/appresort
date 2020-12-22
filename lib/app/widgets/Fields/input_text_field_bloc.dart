import 'package:appresort/app/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InputTextFieldBloc extends StatelessWidget {
  final TextFieldBloc<Object> textFieldBloc;
  final String labelText, hintText, counterText;
  final TextInputType keyboardType;
  final SuffixButton suffixButton;
  final Widget suffix;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final Function onSubmitted;
  final TextStyle labelStyle, style;
  final int maxLength;
  final bool maxLengthEnforced;

  InputTextFieldBloc({
    Key key,
    @required this.textFieldBloc,
    this.labelText,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.inputFormatters,
    this.suffixButton,
    this.labelStyle,
    this.style,
    this.maxLength,
    this.maxLengthEnforced = false,
    this.hintText,
    this.suffix,
    this.counterText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      textInputAction: textInputAction,
      textFieldBloc: textFieldBloc,
      onSubmitted: onSubmitted ?? (_) => FocusScope.of(context).nextFocus(),
      keyboardType: keyboardType,
      suffixButton: suffixButton,
      maxLength: maxLength,
      maxLengthEnforced: maxLengthEnforced,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        counterText: counterText,
        suffix: suffix,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.kSecondColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.kSecondColor,
          ),
        ),
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
      ),
      style: style,
    );
  }
}
