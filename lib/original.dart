/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date and Time Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Add your onPressed callback here
              },
            ),
          ],
        ),
        body: DateAndTime(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateAndTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final dateLabels =
        List.generate(7, (index) => today.add(Duration(days: index)));

    final timeLabels = List.generate(7, (index) => '${index + 2}:00 PM');

    return Container(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('EEEE, MMMM d').format(today),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final day in dayLabels) Text(day),
            ],
          ),
          SizedBox(height: 12.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 48.0),
                    for (final time in timeLabels)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Text(
                          time,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 68.0,
                      ),
                      for (final date in dateLabels)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16.0,
                                child: Text(
                                  DateFormat('d').format(date),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 30.0),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 38.0),
                    for (int i = 0; i < 4; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 08.0),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                String text = '';
                                return AlertDialog(
                                  title: Text('Enter Text'),
                                  content: TextField(
                                    onChanged: (value) {
                                      text = value;
                                    },
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(text);
                                      },
                                      child: Text('Submit'),
                                    ),
                                  ],
                                );
                              },
                            ).then((value) {
                              if (value != null && value.isNotEmpty) {
                                // Do something with the text
                                print('User entered: $value');
                              }
                            });
                          },
                          child: Card(
                            color: Colors.lightGreen,
                            child: Container(
                              width: 370,
                              height: 54,
                              child: Center(
                                child: Text("Card $i"),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
/*class DateAndTime extends StatelessWidget {
  List<String> teacherList = [
    'Usman',
    'Zaffar',
    'Naveed',
    'Amara',
    'Toqeer',
    'Nouman'
  ];
  List<String> sectionList = ['A', 'B', 'C', 'D', 'E', 'F'];
  List<String> classroomList = ['B102', '101', '102', 'B112', '117', '012'];
  List<String> startendtimeList = [
    '2:00-3:00 PM',
    '3:00-400 PM',
    '4:00-5:00 PM',
    '5:00-6:00 PM',
    '6:00-7:00 PM',
    '7:00-8:00 PM',
  ];
  final List<String> teachers = [
    'Usman',
    'Zaffar',
    'Naveed',
    'Amara',
    'Toqeer',
    'Nouman'
  ];
  final List<String> sections = ['A', 'B', 'C', 'D', 'E', 'F'];
  final List<String> classrooms = ['B102', '101', '102', 'B112', '117', '012'];
  final List<String> startendtimes = [
    '2:00-3:00 PM',
    '3:00-400 PM',
    '4:00-5:00 PM',
    '5:00-6:00 PM',
    '6:00-7:00 PM',
    '7:00-8:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dayLabels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    final timeLabels = List.generate(7, (index) => '${index + 2}:00 PM');

    final dateLabels = List.generate(
      7,
      (index) => DateFormat('d').format(today.add(Duration(days: index))),
    );

    return Container(
      padding: EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('EEEE, MMMM d').format(today),
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final day in dayLabels) Text(day),
            ],
          ),
          SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final date in dateLabels) Text(date),
            ],
          ),
          SizedBox(height: 12.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.0),
                    for (final time in timeLabels)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Text(
                          time,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 00.0),
                      child: GestureDetector(
                        onTap: () {
                          // code for showing dialog box
                        },
                        child: Card(
                          color: Color.fromARGB(255, 189, 123, 145),
                          child: Container(
                            width: 370,
                            height: 35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Prof: ${teacherList[0]}"),
                                Text("sec: ${sectionList[0]}"),
                                Text("Room: ${classroomList[0]}"),
                                Text("${startendtimeList[0]}"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    for (int i = 1; i < 2; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: GestureDetector(
                          onTap: () {
                            // code for showing dialog box
                          },
                          child: Card(
                            color: Color.fromARGB(255, 189, 123, 145),
                            child: Container(
                              width: 370,
                              height: 35,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Prof: ${teacherList[i]}"),
                                  Text("sec: ${sectionList[i]}"),
                                  Text("Room: ${classroomList[i]}"),
                                  Text("${startendtimeList[i]}"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    for (int i = 1; i < 7; i++)
      Padding(
        padding: const EdgeInsets.only(bottom: 08),
        child: GestureDetector(
          onTap: () {
            // code for showing dialog box
          },
          child: Card(
            color: Color.fromARGB(255, 189, 123, 145),
            child: Container(
              width: 380,
              height: 35,
              child: Center(
                child: Text("Card $i"),
              ),
            ),
          ),
        ),
      );
  }
}
*/