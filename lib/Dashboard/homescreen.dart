import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:temporarystaff/Dashboard/showschedule.dart';

import 'course_unit.dart';
import 'coursedetails.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoursesScreen()
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



class CoursesScreen extends StatefulWidget {
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
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text(
      //           'Drawer Header',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 24,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('Settings'),
      //         onTap: () {
      //           // TODO: navigate to settings screen
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.help),
      //         title: Text('Help'),
      //         onTap: () {
      //           // TODO: navigate to help screen
      //         },
      //       ),
      //     ],
      //   ),
      // ),
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
                          builder: (context) => CourseDetailsScreen(
                            course: items[index],
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
