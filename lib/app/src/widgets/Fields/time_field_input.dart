
import 'package:appresort/app/src/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TimeFieldInput extends StatelessWidget {
  final InputFieldBloc<DateTime, Object> dateTimeFieldBloc;
  final DateFormat format;
  final DateTime initialDate, firstDate, lastDate;
  final String hintText, labelText;
  final TextStyle labelStyle;
  final Icon prefixIcon, suffixIcon;
  final bool canSelectTime;

  TimeFieldInput({
    Key key,
    @required this.dateTimeFieldBloc,
    this.format,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon = const Icon(Icons.calendar_today),
    this.canSelectTime = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DateTimeFieldBlocBuilder(
      dateTimeFieldBloc: dateTimeFieldBloc,
      canSelectTime: canSelectTime,
      format: format ?? DateFormat('dd/MM/yyyy'),
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2020),
      lastDate: lastDate ?? DateTime(2100),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
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
      ),
    );
  }
}
