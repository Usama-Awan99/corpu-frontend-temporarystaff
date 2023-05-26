import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temporarystaff/Dashboard/homescreen.dart';
import 'package:temporarystaff/Signup/signup.dart';
import 'package:http/http.dart' as http;

import '../DashbordLoggedIn/loggedinhomescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please sign in to continue',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          String passwordurl = _passwordController.text;
                          print("Test string $passwordurl");
                          String emailurl = _emailController.text;
                          final url = Uri.parse('https://corp-u.herokuapp.com/getSessional/$emailurl/$passwordurl');


                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(width: 10),
                                  Text('Loading...'),
                                ],
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          try {
                            final response = await http.get(url);

                            if (response.statusCode == 200) {
                              print("Hello how are you");
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              // Handle the fetched data
                              dynamic data = response.body;
                              // UserData newdata = UserData(
                              //   name: data["name"],
                              //   email: data["email"],
                              //   contact: data["contact"],
                              //   qualification: data["qualification"],
                              //   preferences: data["preferences"], timing: [],
                              // );
                              print("data second $data");
                              // Navigate to another screen
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              final jsonMap = json.decode(data);
                              print("Third data $jsonMap");
                              final user = User.fromJson(jsonMap);
                              print("Before navigation");

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoggedinHomeScreen(data:user),
                                ),
                              );
                            }
                          } catch (error) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            final errorSnackBar = SnackBar(
                              content: Text('Failed to fetch data'),
                              duration: Duration(seconds: 2),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
                          }















                          // CircularProgressIndicator();
                          //
                          // String passwordurl = _passwordController.text;
                          // print("Test string $passwordurl");
                          // String emailurl = _emailController.text;
                          // var url = Uri.parse(
                          //     'https://corp-u.herokuapp.com/getSessional/$emailurl/$passwordurl');
                          //
                          // var response = await http.get(url);
                          //
                          // if (response.statusCode == 200) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomeScreen(),
                          //     ),
                          //   );
                          // } else {
                          //   _showSnackBar(
                          //       context, "Something Went Wrong", "Dissmiss");
                          // }
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                    // Center(
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Forgot Password?',
                    //       style: TextStyle(
                    //         color: Colors.grey,
                    //         fontSize: 16,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(
    BuildContext context,
    String content,
    String label,
  ) {
    final snackBar = SnackBar(
      content: Text(content),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: label,
        onPressed: () {},
      ),
    );

    // Show the snackbar using the ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String qualification;
  final String contact;
  final List<String> preferences;
  final bool status;
  final List<List<bool>> timing;
  final List<List<bool>> bookings;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.qualification,
    required this.contact,
    required this.preferences,
    required this.status,
    required this.timing,
    required this.bookings,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print("In from json");
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      qualification: json['qualification'],
      contact: json['contact'],
      preferences: List<String>.from(json['preferences']),
      status: json['status'],
      timing: List<List<bool>>.from(
        json['timing'].map((day) => List<bool>.from(day)),
      ),
      bookings: List<List<bool>>.from(
        json['bookings'].map((day) => List<bool>.from(day)),
      ),
    );

  }
}

