import 'package:flutter/material.dart';
import '../Dashboard/course_unit.dart';
import '../Login/login.dart';
import 'package:http/http.dart' as http;
class LoggedinCourseDetailsScreen extends StatelessWidget {
  final CourseUnit course ;
  final User data;

  LoggedinCourseDetailsScreen({required this.course, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Duration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(course.duration),
            SizedBox(height: 16),
            Text(
              'Schedule',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Duration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('${course.duration} hours'),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () async {

                  try {
                    final url = Uri.parse('https://corp-u.herokuapp.com/apply/${data.id}/${course.courseid}');
                    final response = await http.put(url);

                    if (response.statusCode == 200) {
                      // Successful request
                      print('Application successfully submitted');
                      // TODO: Handle success case (e.g., show a success message)
                    } else {
                      // Request failed
                      print('Failed to submit application. Status code: ${response.statusCode}');
                      // TODO: Handle error case (e.g., show an error message)
                    }
                  } catch (e) {
                    // Error occurred
                    print('Error submitting application: $e');
                    // TODO: Handle error case (e.g., show an error message)
                  } finally {
                    // TODO: Handle apply button click
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(width: 10),
                            Text('Applied Successfully...'),
                          ],
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                  }







                },
                child: Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
