import 'package:appresort/app/data/models/chat_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const accentColor = Color(0xffc2185b);

class MessageItem extends StatelessWidget {
  final ChatModel message;
  const MessageItem({
    Key key,
    @required this.message,
  }) : super(key: key);

  Widget getUsernameView() {
    return Text(
      message.username,
      style: GoogleFonts.quicksand(
        fontSize: 12,
        color: Color(0xff718792),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return sender(message);
  }

  Widget sender(ChatModel message) {
    return Wrap(
      alignment: message.sender ? WrapAlignment.end : WrapAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: message.sender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            !message.sender
                ? CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      message.photo,
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment:
                  message.sender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!message.sender) getUsernameView(),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 300,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: message.sender ? Color(0xFF2BA873) : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(message.sender ? 30 : 0),
                      bottomRight: Radius.circular(!message.sender ? 30 : 0),
                    ),
                  ),
                  child: Text(
                    message.message,
                    style: GoogleFonts.quicksand(
                      color: message.sender ? Colors.white : Colors.black45,
                    ),
                  ),
                ),
                if (message.sender) getUsernameView(),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
