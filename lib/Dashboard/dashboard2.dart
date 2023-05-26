import 'package:flutter/material.dart';

import 'course_unit.dart';
import 'dashboard.dart';



class Dashboard2 extends StatefulWidget {
  List<CourseUnit> courses;
   Dashboard2({Key? key,required this.courses}) : super(key: key);

  @override
  State<Dashboard2> createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: CourseUnitListScreen(courses: widget.courses,),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Add profile screen here
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Add settings screen here
              },
            ),
          ],
        ),
      ),
    );
  }
}
