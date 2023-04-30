/*import 'package:flutter/material.dart';

class CalendarNode {
  int dayOfMonth;
  String dayOfWeek;
  CalendarNode? next;

  CalendarNode({required this.dayOfMonth, required this.dayOfWeek});
}

class Calendar {
  final int month;
  final int year;
  final List<String> daysOfWeek = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];
  CalendarNode? head;

  final String title;

  Calendar({required this.month, required this.year, required this.title}) {
    DateTime firstDayOfMonth = DateTime(year, month, 1);
    int numDaysInMonth = DateTime(year, month + 1, 0).day;
    int firstDayOfWeekIndex = firstDayOfMonth.weekday - 1;
    CalendarNode? current;
    for (int i = 1; i <= numDaysInMonth; i++) {
      String dayOfWeek = daysOfWeek[(firstDayOfWeekIndex + i - 1) % 7];
      CalendarNode node = CalendarNode(dayOfMonth: i, dayOfWeek: dayOfWeek);
      if (current == null) {
        head = node;
        current = node;
      } else {
        current.next = node;
        current = node;
      }
    }
  }

  CalendarNode? getNodeForDayOfMonth(int dayOfMonth) {
    CalendarNode? node = head;
    while (node != null && node.dayOfMonth != dayOfMonth) {
      node = node.next;
    }
    return node;
  }
}

class CalendarWidget extends StatelessWidget {
  final Calendar calendar;
  final double cellWidth;
  final double cellHeight;

  CalendarWidget(
      {required this.calendar,
      required this.cellWidth,
      required this.cellHeight});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 7 * 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: cellWidth / cellHeight,
      ),
      itemBuilder: (context, index) {
        int row = index ~/ 7;
        int col = index % 7;
        if (row == 0) {
          return Center(
            child: Text(
              calendar.daysOfWeek[col],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          int dayOfMonth = (row - 1) * 7 + col + 1 - calendar.head!.dayOfMonth;
          if (dayOfMonth < 1 || dayOfMonth > 31) {
            return SizedBox();
          } else {
            CalendarNode? node = calendar.getNodeForDayOfMonth(dayOfMonth);
            return Center(
              child: Text('${node?.dayOfMonth}'),
            );
          }
        }
      },
    );
  }
}

class CalendarPage extends StatelessWidget {
  final Calendar calendar = Calendar(month: 4, year: 2023, title: 'Calendar');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(calendar.title),
      ),
      body: CalendarWidget(
        calendar: calendar,
        cellWidth: 50,
        cellHeight: 50,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CalendarPage()));
  debugShowCheckedModeBanner:
  false;
}*/


/*import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class DateNode {
  late DateTime date;
  DateNode? next;

  DateNode(DateTime date) {
    this.date = date;
    this.next = null;
  }
}

class DateList {
  DateNode? head;

  DateList() {
    head = null;
  }

  void insert(DateTime date) {
    DateNode newNode = DateNode(date);
    if (head == null) {
      head = newNode;
    } else {
      DateNode current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
  }

  List<DateTime> toList() {
    List<DateTime> dates = [];
    DateNode? current = head;
    while (current != null) {
      dates.add(current.date);
      current = current.next;
    }
    return dates;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateList months = DateList();

  @override
  void initState() {
    super.initState();
    months.insert(DateTime.now());
    months.insert(DateTime.now().add(Duration(days: 30)));
    months.insert(DateTime.now().add(Duration(days: 60)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
        ),
        body: Center(
          child: DropdownButton<DateTime>(
            hint: Text("Select a month"),
            value: null,
            items: months.toList().map((DateTime value) {
              return DropdownMenuItem<DateTime>(
                value: value,
                child: Text('${value.month}-${value.year}'),
              );
            }).toList(),
            onChanged: (DateTime? value) {
              if (value != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MonthCalendar(value),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class MonthCalendar extends StatelessWidget {
  final DateTime month;

  MonthCalendar(this.month);

  List<Widget> _buildWeekDays() {
    return List.generate(
      7,
      (index) => Container(
        alignment: Alignment.center,
        child: Text(
          ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<Widget> _buildDays() {
    List<Widget> days = [];
    int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    int firstWeekday = DateTime(month.year, month.month, 1).weekday;
    int lastWeekday = DateTime(month.year, month.month, daysInMonth).weekday;
    int weekDay = 1;
    for (int i = 0; i < 6; i++) {
      List<Widget> row = [];
      for (int j = 0; j < 7; j++) {
        if (i == 0 && j < firstWeekday ||
            i == 5 && j > lastWeekday ||
            weekDay > daysInMonth) {
          row.add(SizedBox.shrink());
        } else {
          row.add(Container(
            alignment: Alignment.center,
            child: Text('$weekDay-${month.month}-${month.year}'),
          ));
          weekDay++;
        }
      }
      days.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: row,
      ));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${month.month}-${month.year}'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildWeekDays(),
          ),
          SizedBox(height: 10),
          Column(
            children: _buildDays(),
          ),
        ],
      ),
    );
  }
}*/


/*import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<String> weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weekdays Dropdown',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weekdays Dropdown'),
        ),
        body: Center(
          child: DropdownButton<String>(
            hint: Text('Select a weekday'),
            value: null,
            items: weekdays
                .map((weekday) => DropdownMenuItem<String>(
                      value: weekday,
                      child: Text(weekday),
                    ))
                .toList(),
            onChanged: (selectedWeekday) {
              // Navigate to calendar screen when a weekday is selected
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalendarScreen(
                    weekday: selectedWeekday ?? '',
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  final String weekday;

  const CalendarScreen({Key? key, required this.weekday}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.weekday} Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2023),
            lastDay: DateTime.utc(2024),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          const SizedBox(height: 8.0),
          Text('Selected day: ${_selectedDay?.toString() ?? 'None'}'),
        ],
      ),
    );
  }
}
*/

