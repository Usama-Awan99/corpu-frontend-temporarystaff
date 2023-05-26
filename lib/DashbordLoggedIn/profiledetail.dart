import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  final String name;
  final String email;
  final String contact;
  final String qualification;
  final List<String> preferences;
  final List<List<bool>> timing;

  UserDetailsScreen({
    required this.name,
    required this.email,
    required this.contact,
    required this.qualification,
    required this.preferences,
    required this.timing,
  });
List<String> days =["Monday","Tuesday","Wednesday","Thursday","Friday"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name'),
            SizedBox(height: 8.0),
            Text('Email: $email'),
            SizedBox(height: 8.0),
            Text('Contact: $contact'),
            SizedBox(height: 8.0),
            Text('Qualification: $qualification'),
            SizedBox(height: 8.0),
            Text('Preferences:'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: preferences.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Text('Preference ${index + 1}: ${preferences[index]}'),
                );
              },
            ),
            SizedBox(height: 8.0),
            Text('Availability:'),
            for (int i = 0; i < timing.length; i++)
              Row(
                children: [
                  Text('${days[i]}:'),
                  SizedBox(width: 8.0),
                  Text('AM: ${timing[i][0] ? 'Available' : 'Not Available'}'),
                  SizedBox(width: 8.0),
                  Text('PM: ${timing[i][1] ? 'Available' : 'Not Available'}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
