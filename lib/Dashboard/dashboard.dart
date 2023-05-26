import 'package:flutter/material.dart';

import 'course_unit.dart';
import 'coursedetails.dart';

class CourseUnitListScreen extends StatelessWidget {
  final List<CourseUnit> courses;

  CourseUnitListScreen({required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          CourseUnit course = courses[index];
          return Card(
            child: ListTile(
              title: Text(course.title),
              subtitle: Text(course.duration),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailsScreen(course: course),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
