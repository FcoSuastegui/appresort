import 'package:appresort/app/utils/my_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputChat extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const InputChat({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  _InputChatState createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              placeholder: "Ingresa tu mensaje...",
              placeholderStyle: GoogleFonts.quicksand(
                color: Colors.black45,
              ),
              style: GoogleFonts.quicksand(
                color: Colors.black45,
              ),
              controller: _controller,
            ),
          ),
          IconButton(
            splashColor: Colors.transparent,
            splashRadius: 20,
            icon: MyIcons.name(
              name: 'send',
              color: Colors.black45,
            ),
            onPressed: () {
              widget.onChanged(_controller.text);
              if (_controller.text != '') {
                _controller.text = '';
              }
            },
            color: Color(0xff546e7a),
            padding: EdgeInsets.all(0),
          )
        ],
      ),
    );
  }
}
