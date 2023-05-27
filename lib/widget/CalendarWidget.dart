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
  final CalendarView _calendarView = CalendarView.day;
  TextEditingController _textEditingController = TextEditingController();

  final Map<DateTime, String> _slotTextMap = {};
  List<Meeting> meetings = [];

  final List<DateTime> _startTimes = [
    DateTime(2023, 5, 25, 9, 0, 0),
    DateTime(2023, 5, 25, 11, 0, 0),
    DateTime(2023, 5, 25, 13, 0, 0),
    // DateTime(2023, 5, 25, 15, 0, 0),
  ];

  final List<DateTime> _endTimes = [
    DateTime(2023, 5, 25, 11, 0, 0),
    DateTime(2023, 5, 25, 13, 0, 0),
    DateTime(2023, 5, 25, 15, 0, 0),
    // DateTime(2023, 5, 25, 17, 0, 0),
  ];

  final List<String> _courses = [
    'Artificial Intelligence',
    'Data structure and algorithm',
    'Data Science',
    // 'Database',
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   // _calendar = ;
  // }

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SfCalendar(
        view: _calendarView,
        showCurrentTimeIndicator: true,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
        onLongPress: (CalendarLongPressDetails details) {
          // print('id: ${details.targetElement.name}');

          // print("index: ${details.date}");

          showDialog(
            context: context,
            builder: (BuildContext context) {
              // String? slotText;
              // if (details.date != null) {
              //   slotText = _slotTextMap[details.date!];
              //   Center(
              //     child: Text(slotText ??
              //         ''), // Display the slot text, or an empty string if it is null
              //   );
              // }

              // Get any existing text for the slot
              return AlertDialog(
                title: Text('Add text to slot'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'Enter text here'),
                  controller: _textEditingController, // Use the text controller
                  // onChanged: (value) {
                  //   setState(() {
                  //     // _slotTextMap[details.date!] = value;

                  //   });
                  // },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // String enteredText =
                      //     _textEditingController.text; // Get the entered text
                      // setState(() {
                      //   _slotTextMap[details.date!] =
                      //       enteredText; // Save the text to your data source
                      //   slotText =
                      //       enteredText; // Update the displayed text in the slot
                      // });
                      // print(_textEditingController.text);
                      // meetings[details.targetElement.index].eventName =
                      //     _textEditingController.text;
                      setState(() {
                        // for (var d in ) {
                        //   _startTimes = details.date
                        // }
                        Meeting a = details.appointments![0];
                        print("index: ${a.m_id}");

                        _courses[a.m_id] = _textEditingController.text;
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          );
        },
      ),
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

  List<Meeting> _getDataSource() {
    meetings = [];
    for (int i = 0; i < _startTimes.length; i++) {
      meetings.add(Meeting(
        i,
        _courses[i],
        _startTimes[i],
        _endTimes[i],
        Color.fromARGB(255, i * 50, 255 - i * 50, 0),
        false,
      ));
    }
    return meetings;
  }
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
  Meeting(this.m_id, this.eventName, this.from, this.to, this.background,
      this.isAllDay);

  int m_id;
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
