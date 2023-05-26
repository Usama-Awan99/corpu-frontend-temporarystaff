import 'package:flutter/material.dart';

class ShowScheduleScreen extends StatefulWidget {
  @override
  _ShowScheduleScreenState createState() => _ShowScheduleScreenState();
}

class _ShowScheduleScreenState extends State<ShowScheduleScreen> {
  final List<Map<String, String>> _schedule = [
    {
      'title': 'Math Tutoring',
      'description': 'Help with algebra and geometry',
      'time': '8:00am - 9:00am',
      'location': 'Online',
    },
    {
      'title': 'English Tutoring',
      'description': 'Help with writing and reading comprehension',
      'time': '10:00am - 11:00am',
      'location': 'In-person',
    },
    {
      'title': 'Science Tutoring',
      'description': 'Help with biology and chemistry',
      'time': '2:00pm - 3:00pm',
      'location': 'Online',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: ListView.builder(
        itemCount: _schedule.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_schedule[index]['title']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_schedule[index]['description']!),
                  Text('Time: ${_schedule[index]['time']}'),
                  Text('Location: ${_schedule[index]['location']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
