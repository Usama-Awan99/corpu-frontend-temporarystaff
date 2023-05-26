import 'package:flutter/material.dart';

class SignUpScreen2 extends StatefulWidget {
  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  String name = '';
  String email = '';
  String password = '';
  List<String> preferences = [];
  List<List<bool>> timing = [
    [false, false],
    [false, false],
    [false, false],
    [false, false],
    [false, false],
  ];

  List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  TextEditingController preferenceController = TextEditingController();

  @override
  void dispose() {
    preferenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Name',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Preferences',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: preferences.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    controller: TextEditingController(text: preferences[index]),
                    onChanged: (value) {
                      setState(() {
                        preferences[index] = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your preference ${index + 1}',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            preferences.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Availability'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0; i < timing.length; i++)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(daysOfWeek[i]),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            timing[i][0] = !timing[i][0];
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: timing[i][0] ? Colors.blue : Colors.transparent,
                                            border: Border.all(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            color: timing[i][0] ? Colors.white : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8.0),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            timing[i][1] = !timing[i][1];
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: timing[i][1] ? Colors.blue : Colors.transparent,
                                            border: Border.all(
                                              color: Colors.blue,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            color: timing[i][1] ? Colors.white : Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('Select Availability'),
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                signUp();
              },
              child: Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp() {
    // Implement your logic to save the sign-up details
    print('Name: $name');
    print('Email: $email');
    print('Password: $password');
    print('Preferences: $preferences');
    print('Availability: $timing');
  }
}

