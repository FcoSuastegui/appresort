import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// ignore: implementation_imports
import 'package:flutter_form_bloc/src/utils/utils.dart';

class InputTextCupertino extends StatefulWidget {
  final TextFieldBloc<Object> textFieldBloc;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter> inputFormatters;
  final InputDecoration decoration;
  final bool obscureText;
  final OverlayVisibilityMode clearButtonMode;
  final SuffixButton suffixButton;
  final Widget obscureTextTrueIcon;
  final Widget obscureTextFalseIcon;
  final Widget clearTextIcon;
  final Widget asyncValidatingIcon;
  final Widget suffix;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FieldBlocErrorBuilder errorBuilder;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool animateWhenCanShow;
  final bool isEnabled;
  final bool enableOnlyWhenFormBlocCanSubmit;
  final EdgeInsetsGeometry padding;
  final TextStyle placeholderStyle, style;
  final String placeholder;

  const InputTextCupertino({
    Key key,
    @required this.textFieldBloc,
    this.focusNode,
    this.onChanged,
    this.inputFormatters,
    this.suffixButton,
    this.obscureTextTrueIcon = const Icon(
      Icons.visibility,
    ),
    this.obscureTextFalseIcon = const Icon(Icons.visibility_off),
    this.clearTextIcon = const Icon(Icons.clear),
    this.asyncValidatingIcon = const SizedBox(
      height: 24,
      width: 24,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    ),
    this.obscureText,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.errorBuilder,
    this.readOnly = false,
    this.animateWhenCanShow = true,
    this.isEnabled = true,
    this.enableOnlyWhenFormBlocCanSubmit = false,
    this.padding,
    this.clearButtonMode = OverlayVisibilityMode.never,
    this.placeholderStyle,
    this.style,
    this.placeholder,
    this.suffix,
  }) : super(key: key);

  @override
  _InputTextCupertinoState createState() => _InputTextCupertinoState();
}

class _InputTextCupertinoState extends State<InputTextCupertino> {
  TextEditingController _controller;
  bool _obscureText;
  VoidCallback _controllerListener;
  FocusNode _focusNode;

  @override
  void initState() {
    _controllerListener = _textControllerListener;
    _controller = TextEditingController(text: widget.textFieldBloc?.state?.value);
    _controller.addListener(_controllerListener);

    _obscureText = widget.suffixButton != null && widget.suffixButton == SuffixButton.obscureText;
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
    }
    super.initState();
  }

  void _textControllerListener() {
    if (widget.textFieldBloc.state.formBloc?.state is FormBlocSubmitting) {
      if (_controller.text != (widget.textFieldBloc.value ?? '')) {
        _fixControllerTextValue(widget.textFieldBloc.value ?? '');
      }
    }
  }

  void _fixControllerTextValue(String value) async {
    _controller
      ..text = value ?? ''
      ..selection = TextSelection.collapsed(offset: _controller.text.length);

    await Future.delayed(Duration(milliseconds: 0));
    _controller.selection = TextSelection.collapsed(offset: _controller.text.length);
  }

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _focusNode;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _builderSuffix(TextFieldBlocState state) {
    Widget suffix;
    if (widget.suffixButton != null) {
      switch (widget.suffixButton) {
        case SuffixButton.obscureText:
          if (widget.obscureText == null) {
            suffix = Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                child: _obscureText ? widget.obscureTextTrueIcon : widget.obscureTextFalseIcon,
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            );
          }
          break;
        case SuffixButton.clearText:
          suffix = Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              child: widget.clearTextIcon,
              onTap: () {
                widget.textFieldBloc.clear();
              },
            ),
          );
          break;
        case SuffixButton.asyncValidating:
          suffix = AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: state.canShowIsValidating ? 1.0 : 0.0,
            child: widget.asyncValidatingIcon,
          );
      }
    }

    return suffix;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.textFieldBloc == null) {
      return SizedBox();
    }

    return CanShowFieldBlocBuilder(
      fieldBloc: widget.textFieldBloc,
      animate: widget.animateWhenCanShow,
      builder: (_, __) {
        return BlocBuilder<TextFieldBloc, TextFieldBlocState>(
          cubit: widget.textFieldBloc,
          builder: (context, state) {
            final isEnabled = fieldBlocIsEnabled(
              isEnabled: widget.isEnabled,
              enableOnlyWhenFormBlocCanSubmit: widget.enableOnlyWhenFormBlocCanSubmit,
              fieldBlocState: state,
            );

            if (_controller.text != state.value) {
              _fixControllerTextValue(state.value);
            }
            return DefaultFieldBlocBuilderPadding(
              padding: widget.padding,
              child: _buildTextField(state: state, isEnabled: isEnabled),
            );
          },
        );
      },
    );
  }

  Widget _buildTextField({@required TextFieldBlocState state, @required bool isEnabled}) {
    String errorText = Style.getErrorText(
      context: context,
      errorBuilder: widget.errorBuilder,
      fieldBlocState: state,
      fieldBloc: widget.textFieldBloc,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CupertinoTextField(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          placeholder: widget.placeholder,
          obscureText: _obscureText,
          controller: _controller,
          clearButtonMode: widget.clearButtonMode,
          suffix: widget.suffix ?? _builderSuffix(state),
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 13,
          ),
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readOnly,
          focusNode: _effectiveFocusNode,
          onChanged: (value) {
            widget.textFieldBloc.updateValue(value);
            if (widget.onChanged != null) {
              widget.onChanged(value);
            }
          },
          placeholderStyle: widget.placeholderStyle ??
              Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.3),
                  ),
          style: widget.style ??
              Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.7),
                  ),
        ),
        errorText == null || errorText.isEmpty
            ? SizedBox.shrink()
            : Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.0,
                  vertical: 10.0,
                ),
                child: Text(
                  errorText,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              )
      ],
    );
  }
}
