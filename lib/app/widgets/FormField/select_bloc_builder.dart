import 'package:appresort/app/themes/adapt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// ignore: implementation_imports
import 'package:flutter_form_bloc/src/utils/utils.dart';

class SelectBlocBuilder<Value> extends StatefulWidget {
  final String label;
  final SelectFieldBloc<Value, Object> selectFieldBloc;
  final FocusNode nextFocusNode;
  final FieldBlocStringItemBuilder<Value> itemBuilder;
  final Function(Value) onChanged;

  const SelectBlocBuilder({
    Key key,
    this.label = '',
    @required this.selectFieldBloc,
    @required this.itemBuilder,
    @required this.onChanged,
    this.nextFocusNode,
  }) : super(key: key);

  @override
  _SelectBlocBuilderState<Value> createState() => _SelectBlocBuilderState<Value>();
}

class _SelectBlocBuilderState<Value> extends State<SelectBlocBuilder<Value>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(widget.label),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: Row(
            children: [
              Expanded(
                child: BlocBuilder<SelectFieldBloc<Value, dynamic>,
                    SelectFieldBlocState<Value, dynamic>>(
                  cubit: widget.selectFieldBloc,
                  builder: (context, fieldState) {
                    final isEnabled = fieldBlocIsEnabled(
                      isEnabled: true,
                      enableOnlyWhenFormBlocCanSubmit: false,
                      fieldBlocState: fieldState,
                    );
                    return DropdownButton<Value>(
                      value: fieldState.value,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: Adapt.px(25),
                        fontWeight: FontWeight.bold,
                      ),
                      icon: SizedBox.shrink(),
                      isDense: true,
                      underline: SizedBox.shrink(),
                      onChanged: fieldBlocBuilderOnChange<Value>(
                        isEnabled: isEnabled,
                        nextFocusNode: widget.nextFocusNode,
                        onChanged: (value) {
                          widget.selectFieldBloc.updateValue(value);
                          widget.onChanged(value);
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                      items: fieldState.items.isEmpty ? null : _buildItems(fieldState.items),
                    );
                  },
                ),
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.black.withOpacity(0.4),
                size: Adapt.px(30),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<Value>> _buildItems(Iterable<Value> items) {
    List<DropdownMenuItem<Value>> menuItems;
    menuItems = items.map<DropdownMenuItem<Value>>(
      (Value value) {
        return DropdownMenuItem<Value>(
          value: value,
          child: Text(widget.itemBuilder(context, value)),
        );
      },
    ).toList();
    return menuItems;
  }
}
