import 'package:calendar/model/eventdatasource.dart';
import 'package:calendar/provider/eventprovider.dart';
import 'package:calendar/widget/taskwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late SfCalendar _calendar;
  CalendarView _calendarView = CalendarView.day;

  @override
  void initState() {
    super.initState();
    _calendar = SfCalendar(
      view: _calendarView,
      showCurrentTimeIndicator: true,
      dataSource: MeetingDataSource(_getDataSource()),
      monthViewSettings: MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
        ),
        body: _calendar
        // body: SfCalendar(
        //   view: CalendarView.day,
        //   dataSource: EventDataSource(events),
        //   initialSelectedDate: DateTime.now(),
        //   onLongPress: (details) {
        //     final provider = Provider.of<EventProvider>(context, listen: true);

        //     provider.setDate(details.date!);
        //     showModalBottomSheet(
        //       context: context,
        //       builder: (context) => TasksWidget(),
        //     );
        //   },
        // ),
        );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();

  // Create and add Meeting object for slot 1
  final DateTime slot1StartTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime slot1EndTime =
      DateTime(today.year, today.month, today.day, 11, 0, 0);
  meetings.add(Meeting(
    'Artificial Intelligence',
    slot1StartTime,
    slot1EndTime,
    Color.fromARGB(255, 122, 134, 15),
    false,
  ));

  // Create and add Meeting object for slot 2
  final DateTime slot2StartTime =
      DateTime(today.year, today.month, today.day, 11, 0, 0);
  final DateTime slot2EndTime =
      DateTime(today.year, today.month, today.day, 13, 0, 0);
  meetings.add(Meeting(
    'Data structure and algorithm',
    slot2StartTime,
    slot2EndTime,
    Color.fromARGB(255, 82, 134, 15),
    false,
  ));

  // Create and add Meeting object for slot 3
  final DateTime slot3StartTime =
      DateTime(today.year, today.month, today.day, 13, 0, 0);
  final DateTime slot3EndTime =
      DateTime(today.year, today.month, today.day, 15, 0, 0);
  meetings.add(Meeting(
    'Data Science',
    slot3StartTime,
    slot3EndTime,
    Color.fromARGB(255, 15, 134, 78),
    false,
  ));

  // Create and add Meeting object for slot 4
  final DateTime slot4StartTime =
      DateTime(today.year, today.month, today.day, 15, 0, 0);
  final DateTime slot4EndTime =
      DateTime(today.year, today.month, today.day, 17, 0, 0);
  meetings.add(Meeting(
    'Database',
    slot4StartTime,
    slot4EndTime,
    Color.fromARGB(255, 226, 127, 33),
    false,
  ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
