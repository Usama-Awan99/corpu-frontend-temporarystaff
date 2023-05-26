import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:temporarystaff/Dashboard/homescreen.dart';
import 'package:temporarystaff/Dashboard/showschedule.dart';


import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:temporarystaff/DashbordLoggedIn/profiledetail.dart';

import '../Dashboard/course_unit.dart';
import '../Dashboard/coursedetails.dart';
import '../Login/login.dart';
import 'LoggedinCourseDetailsScreen.dart';
import 'applications.dart';

class LoggedinHomeScreen extends StatefulWidget {

  User data;
  LoggedinHomeScreen({required this.data});
  @override
  _LoggedinHomeScreenState createState() => _LoggedinHomeScreenState();
}

class _LoggedinHomeScreenState extends State<LoggedinHomeScreen> {
  int _currentIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {

    print("On other screen");
    super.initState();
    _screens = [
      CoursesScreen(data: widget.data,),
      ScheduleScreen(),
      Applications(),
      ProfileScreen(data: widget.data),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Applications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// class CoursesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Courses Screen'),
//     );
//   }
// }

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShowScheduleScreen();
  }
}
class Applications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationsScreen();
  }
}
class ProfileScreen extends StatefulWidget {
  User data;
  ProfileScreen({required this.data});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override




  @override
  Widget build(BuildContext context) {
    return UserDetailsScreen(
      name: widget.data.name,
      email: widget.data.email,
      contact: widget.data.contact,
      timing: widget.data.timing,
      qualification: widget.data.qualification,
      preferences: widget.data.preferences,


    );
  }
}

class CoursesScreen extends StatefulWidget {
  final User data;
  CoursesScreen({required this.data});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {


  bool isLoading = true;
  List<CourseUnit> items = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
      await http.get(Uri.parse('https://corp-u.herokuapp.com/getcourses'));
      print("Response ${response.body}");
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<CourseUnit> fetchedItems = data
            .map((item) => CourseUnit(
          courseid:item['_id'],
          title: item['course_name'],
          credithour: item['credit_hours'],
          duration: item['duration'],
        ))
            .toList();

        setState(() {
          isLoading = false;
          items = fetchedItems;
        });
      } else {
        // Handle error case
        print('Failed to fetch data');
      }
    } catch (e) {
      // Handle error case
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'Corp U',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Applications'),
              onTap: () {
                // TODO: navigate to settings screen
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Schedule'),
              onTap: () {
                // TODO: navigate to help screen
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark_add),
              title: Text('Courses'),
              onTap: () {
                // TODO: navigate to help screen
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // TODO: navigate to help screen
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pop(context);
                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              },
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Loading screen
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: ListTile(
              title: Text(item.title),
              subtitle: Text(item.duration),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoggedinCourseDetailsScreen(
                      course: items[index],
                      data: widget.data,
                    ),
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

//
// ListView.builder(
// itemCount: courses.length,
// itemBuilder: (context, index) {
// final course = courses[index];
// return Card(
// child: ListTile(
// title: Text(course.name),
// subtitle: Text(course.description),
// trailing: Icon(Icons.arrow_forward_ios),
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => CourseDetailsScreen(
// course: courses[index],
// ),
// ),
// );
// },
// ),

class Item {
  final String title;
  final int credithour;
  final String duration;

  Item({required this.title, required this.credithour, required this.duration});
}
