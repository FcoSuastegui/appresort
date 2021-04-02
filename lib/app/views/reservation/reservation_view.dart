import 'package:appresort/app/data/models/meeting_model.dart';
import 'package:appresort/app/data/models/select_model.dart';
import 'package:appresort/app/themes/adapt.dart';
import 'package:appresort/app/themes/app_theme.dart';
import 'package:appresort/app/utils/helper.dart';
import 'package:appresort/app/views/reservation/components/meeting_data_source.dart';
import 'package:appresort/app/views/reservation/components/reservation_modal_add.dart';
import 'package:appresort/app/views/reservation/components/reservation_modal_edit.dart';
import 'package:appresort/app/views/reservation/components/reservation_modal_view.dart';
import 'package:appresort/app/views/reservation/controller/reservacion_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

class ReservationView extends StatefulWidget {
  static final String routeName = '/reservation';
  const ReservationView({Key key}) : super(key: key);

  @override
  _ReservationViewState createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView> {
  final controller = Get.put(ReservacionController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reversaciones"),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Obx(
          () => Stack(
            children: [
              SfCalendar(
                view: CalendarView.month,
                dataSource: MeetingDataSource(controller.metting),
                monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                  showAgenda: true,
                ),
                todayHighlightColor: AppTheme.kPrimaryColor,
                showNavigationArrow: true,
                cellBorderColor: AppTheme.kPrimaryColor.withOpacity(0.3),
                headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  backgroundColor: AppTheme.kPrimaryColor,
                  textStyle: TextStyle(
                    fontSize: 25,
                    decorationColor: Colors.black,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: calendarTapped,
                onViewChanged: (e) {
                  print(e);
                },
                showDatePickerButton: true,
                appointmentTextStyle: TextStyle(
                  fontSize: 25,
                  decorationColor: Colors.black,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 5,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              controller.loading
                  ? Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.1),
                      child: Center(
                        child: Card(
                          shadowColor: Colors.transparent,
                          elevation: 0.0,
                          color: Colors.transparent,
                          child: Container(
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(12.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    final now = DateTime.now();
    final dateCell = details.date;

    if (details.targetElement == CalendarElement.calendarCell) {
      if (now.difference(dateCell).inDays > 0) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.transparent.withOpacity(0.2),
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text("Reservación"),
          content: Text("¿Deseas hacer una nueva reservación?"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Si"),
              onPressed: () {
                Navigator.of(context).pop();
                calendarNew(details);
              },
            ),
            CupertinoDialogAction(
              child: Text("No"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
      return;
    } else {
      calendarEdit(details);
    }
  }

  Future<void> calendarNew(CalendarTapDetails details) async {
    String dateText = DateFormat('yy-MM-dd').format(details.date).toString();
    int weekend = getWeekend(DateFormat('EEE').format(details.date).toString());
    final String exito = await showCupertinoModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      builder: (context) => ReservacionesModalAdd(
        title: "Nueva reservación",
        date: dateText,
        weekend: weekend,
      ),
    );

    if (exito != null && exito.isNotEmpty) {
      controller.getDataSource();
      Helper.success(message: exito, duration: 3000);
    }
  }

  Future<void> calendarEdit(CalendarTapDetails details) async {
    if (details.appointments.length == 0) return;
    final MeetingModel appointmentDetails = details.appointments[0];

    final now = DateTime.now();
    final dateCell = details.date;

    if (now.difference(dateCell).inDays > 0) {
      showCupertinoModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => ReservationModalView(
          reservation: appointmentDetails,
        ),
      );
    } else {
      showCupertinoModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => ReservationModalEdit(
          reservation: appointmentDetails,
        ),
      );
    }
  }

  int getWeekend(String day) => ['Sat', 'Sun'].contains(day) ? 1 : 0;
}
