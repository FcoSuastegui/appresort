import 'package:appresort/app/data/models/chat_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/views/tickets/pages/chat/components/message_item.dart';
import 'package:appresort/app/views/tickets/pages/chat/controller/ticket_chat_controller.dart';
import 'package:appresort/app/views/tickets/pages/chat/components/input_chat.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TicketChatView extends GetView<TicketChatController> {
  static final String routeName = '/ticket-chat';
  const TicketChatView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chat = controller.chatController;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(
          "Comentarios",
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SliverScrollView(
                controller: controller.scroll,
                physics: AlwaysScrollableScrollPhysics(),
                reverse: true,
                onRefresh: () => Future.sync(
                  () => chat.refresh(),
                ),
                slivers: [
                  PagedSliverList.separated(
                    pagingController: chat,
                    builderDelegate: PagedChildBuilderDelegate<ChatModel>(
                      itemBuilder: (context, chat, index) => MessageItem(message: chat),
                      firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                        title: Text("${chat.error}"),
                      ),
                      noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                        content: Column(
                          children: [
                            Text("No hay chat disponibles"),
                            Text("Tire para refrescar"),
                            Icon(Icons.arrow_upward),
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: Adapt.px(0),
                    ),
                  ),
                ],
              ),
            ),
            InputChat(
              onChanged: (String s) {
                if (s.isNotEmpty) {
                  controller.chatAdd(s);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
