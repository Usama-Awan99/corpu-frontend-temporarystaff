import 'package:flutter/material.dart';

class Course {
  final String title;
  final String description;

  Course({required this.title, required this.description});
}

class CourseListScreen extends StatelessWidget {
  final List<Course> courses = [
    Course(
      title: 'Mathematics',
      description: 'Teach basic math skills to primary school students',
    ),
    Course(
      title: 'Science',
      description: 'Teach science concepts to middle school students',
    ),
    Course(
      title: 'English',
      description: 'Teach reading and writing skills to secondary school students',
    ),
    Course(
      title: 'Physical Education',
      description: 'Teach sports and fitness to all age groups',
    ),
    Course(
      title: 'Music',
      description: 'Teach music theory and performance to all age groups',
    ),
  ];

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
              child: Text('Hiring Options'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Temporary Staff'),
              onTap: () {
                // Navigate to temporary staff hiring screen
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Sessional Staff'),
              onTap: () {
                // Navigate to sessional staff hiring screen
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            child: ListTile(
              title: Text(course.title),
              subtitle: Text(course.description),
              trailing: Icon(Icons.arrow_forward_ios),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to home screen
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Navigate to notifications screen
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings screen
              },
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  CourseDetailsScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Apply'),
              onPressed: () {
                // Navigate to apply screen for selected course
              },
            ),
          ],
        ),));}}
