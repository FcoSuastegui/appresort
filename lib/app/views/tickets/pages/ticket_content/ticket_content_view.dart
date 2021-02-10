import 'package:appresort/app/data/models/time_line_model.dart';
import 'package:appresort/app/routes/routes.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/views/tickets/pages/ticket_content/controller/ticket_content_controller.dart';
import 'package:appresort/app/widgets/Cards/card_refresh.dart';
import 'package:appresort/app/widgets/Sliver/sliver_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TicketContentView extends StatefulWidget {
  static final String routeName = '/ticket-content';
  @override
  TicketContentViewState createState() => TicketContentViewState();
}

class TicketContentViewState extends State<TicketContentView> {
  final c = Get.find<TicketContentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          c.ticket.description,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: SliverScrollView(
          onRefresh: () => Future.sync(
            () => c.timeLineController.refresh(),
          ),
          slivers: [
            PagedSliverList.separated(
              pagingController: c.timeLineController,
              builderDelegate: PagedChildBuilderDelegate<TimeLineModel>(
                itemBuilder: (context, timeline, index) {
                  final bool par = index % 2 == 0;
                  final bool first = index == 0;
                  final last = c.timeLineController.itemList.length == index + 1 &&
                      c.timeLineController.itemList.length > 1;

                  return TimelineTile(
                    alignment: TimelineAlign.center,
                    isFirst: first,
                    isLast: last,
                    indicatorStyle: IndicatorStyle(
                      width: 20,
                      color: last ? Colors.green : AppTheme.kPrimaryColor,
                      indicatorXY: 0.2,
                      padding: EdgeInsets.all(8),
                    ),
                    endChild: par
                        ? Container(
                            child: Column(
                              children: [
                                getIcon(index),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  timeline.message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  timeline.date,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                    startChild: !par
                        ? Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                getIcon(index),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  timeline.message,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  timeline.date,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                  );
                },
                firstPageErrorIndicatorBuilder: (context) => CardRefresh(
                  title: Text("No hay timeline disponibles"),
                ),
                noItemsFoundIndicatorBuilder: (context) => CardRefresh(
                  title: Text("No hay timeline disponibles"),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: Adapt.px(0),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF00C962),
        child: Icon(Icons.chat),
        onPressed: () {
          Routes.goToPage('/ticket-chat');
        },
      ),
    );
  }

  Widget getIcon(int index) {
    final List<Icon> icons = [
      Icon(
        FontAwesome.ticket,
        size: 30,
        color: AppTheme.kPrimaryColor,
      ),
      Icon(
        FontAwesome.sign_in,
        size: 30,
        color: AppTheme.kPrimaryColor,
      ),
      Icon(
        FontAwesome.user_plus,
        size: 30,
        color: AppTheme.kPrimaryColor,
      ),
      Icon(
        FontAwesome.check_circle,
        color: Colors.green,
        size: 30,
      ),
    ];
    int indexAux = index + 1;
    return icons.length >= indexAux
        ? icons[index]
        : Icon(
            FontAwesome.question_circle,
            size: 30,
          );
  }
}
