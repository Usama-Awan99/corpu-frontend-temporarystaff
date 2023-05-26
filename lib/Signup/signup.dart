// import 'dart:core';
//
// import 'package:flutter/material.dart';
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class DataSessional {
//   final String name;
//   final String email;
//   final String password;
//   final String qualification;
//   final String contact;
//   final List<String> preferences;
//   final List<List<bool>> timing ;
//   DataSessional({
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.qualification,
//     required this.contact,
//     required this.preferences,
//     required this.timing,
//   });
//
// }
// class _SignUpScreenState extends State<SignUpScreen> {
//   String name = '';
//   String email = '';
//   String password = '';
//   List<String> preferences = [];
//   List<List<bool>> timing = [
//     [false, false],
//     [false, false],
//     [false, false],
//     [false, false],
//     [false, false],
//   ];
//
//   List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
//
//   TextEditingController preferenceController = TextEditingController();
//
//   @override
//   void dispose() {
//     preferenceController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     name = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//                 onChanged: (value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text('Preferences:'),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: preferences.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: 8.0),
//                     child: TextField(
//                       controller: TextEditingController(text: preferences[index]),
//                       onChanged: (value) {
//                         setState(() {
//                           preferences[index] = value;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Preference ${index + 1}',
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.remove),
//                           onPressed: () {
//                             setState(() {
//                               preferences.removeAt(index);
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 8.0),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     setState(() {
//                       preferences.add('');
//                     });
//                   },
//                   child: Text('Add Preference'),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text('Availability:'),
//               for (int i = 0; i < timing.length; i++)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(daysOfWeek[i]),
//                     SizedBox(width: 8.0),
//                     Checkbox(
//                       value: timing[i][0],
//                       onChanged: (value) {
//                         setState(() {
//                           timing[i][0] = value!;
//                         });
//                       },
//                     ),
//                     Text('AM'),
//                     SizedBox(width: 8.0),
//                     Checkbox(
//                       value: timing[i][1],
//                       onChanged: (value) {
//                         setState(() {
//                           timing[i][1] = value!;
//                         });
//                       },
//                     ),
//                     Text('PM'),
//                   ],
//                 ),
//               SizedBox(height: 32.0),
//               ElevatedButton(
//                 onPressed: () {
//                   signUp();
//                 },
//                 child: Text('Sign Up'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void signUp() {
//     // Implement your logic to save the sign-up details
//     print('Name: $name');
//     print('Email: $email');
//     print('Password: $password');
//     print('Preferences: $preferences');
//     print('Availability: $timing');
//   }
// }
//

////////////////////////----------------//////////////////////////////

// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   String name = '';
//   String email = '';
//   String password = '';
//   List<String> preferences = [];
//   List<List<bool>> timing = [
//     [false, false],
//     [false, false],
//     [false, false],
//     [false, false],
//     [false, false],
//   ];
//
//   List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
//
//   TextEditingController preferenceController = TextEditingController();
//
//   @override
//   void dispose() {
//     preferenceController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 'Create an Account',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     name = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 onChanged: (value) {
//                   setState(() {
//                     password = value;
//                   });
//                 },
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'Preferences:',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: preferences.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: 8.0),
//                     child: TextFormField(
//                       controller: TextEditingController(text: preferences[index]),
//                       onChanged: (value) {
//                         setState(() {
//                           preferences[index] = value;
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'Preference ${index + 1}',
//                         border: OutlineInputBorder(),
//                         suffixIcon: IconButton(
//                           icon: Icon(Icons.remove),
//                           onPressed: () {
//                             setState(() {
//                               preferences.removeAt(index);
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               SizedBox(height: 8.0),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     setState(() {
//                       preferences.add('');
//                     });
//                   },
//                   child: Text('Add Preference'),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'Availability:',
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8.0),
//               for (int i = 0; i < timing.length; i++)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       daysOfWeek[i],
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(width: 8.0),
//                     Checkbox(
//                       value: timing[i][0],
//                       onChanged: (value) {
//                         setState(() {
//                           timing[i][0] = value!;
//                         });
//                       },
//                     ),
//                     Text('AM'),
//                     SizedBox(width: 8.0),
//                     Checkbox(
//                       value: timing[i][1],
//                       onChanged: (value) {
//                         setState(() {
//                           timing[i][1] = value!;
//                         });
//                       },
//                     ),
//                     Text('PM'),
//                   ],
//                 ),
//               SizedBox(height: 32.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Row(
//                         children: [
//                           CircularProgressIndicator(),
//                           SizedBox(width: 10),
//                           Text('Loading...'),
//                         ],
//                       ),
//                       duration: Duration(seconds: 2),
//                     ),
//                   );
//                   signUp();
//                     final url = 'https://corp-u.herokuapp.com/createSessional'; // Replace with your API endpoint
//
//                     final staffData = {
//                       'name': name,
//                       'email': email,
//                       'password': password,
//                       'preferences': preferences,
//                       'timing': timing
//                     };
//                     print(staffData);
//
//                     try {
//                       final response = await http.post(
//                         Uri.parse(url),
//                         body: jsonEncode(staffData),
//                         headers: {
//                           'Content-Type': 'application/json',
//                         },
//                       );
//
//                       if (response.statusCode == 201) {
//                         print('Request successful');
//                         print(response.body);
//                       } else {
//                         print('Request failed with status: ${response.statusCode}');
//                       }
//                     } catch (error) {
//                       print('Error: $error');
//                     }
//
//                 },
//                 child: Text('Sign Up'),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void signUp() {
//     // Implement your logic to save the sign-up details
//     print('Name: $name');
//     print('Email: $email');
//     print('Password: $password');
//     print('Preferences: $preferences');
//     print('Availability: $timing');
//   }
// }
//
// class DataSessional {
//   final String name;
//   final String email;
//   final String password;
//   final String qualification;
//   final String contact;
//   final List<String> preferences;
//   final List<List<bool>> timing ;
//   DataSessional({
//     required this.name,
//     required this.email,
//     required this.password,
//     required this.qualification,
//     required this.contact,
//     required this.preferences,
//     required this.timing,
//   });
//
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '';
  String email = '';
  String password = '';
  String contact = '';
  String qualification = '';
  List<String> preferences = [];
  List<List<bool>> timing = [
    [false, false],
    [false, false],
    [false, false],
    [false, false],
    [false, false],
  ];

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  TextEditingController preferenceController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();

  @override
  void dispose() {
    preferenceController.dispose();
    contactController.dispose();
    qualificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    contact = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Contact',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    qualification = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Qualification',
                ),
              ),
              SizedBox(height: 16.0),
              Text('Preferences:'),

              ListView.builder(
                shrinkWrap: true,
                itemCount: preferences.length + 1,
                itemBuilder: (context, index) {
                  if (index == preferences.length) {
                    return ListTile(
                      leading: Icon(Icons.add),
                      title: Text('Add Preference'),
                      onTap: () {
                        setState(() {
                          preferences.add('');
                        });
                      },
                    );
                  } else {
                    return ListTile(
                      title: TextField(
                        onChanged: (value) {
                          setState(() {
                            preferences[index] = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Preference ${index + 1}',
                        ),
                      ),
                    );
                  }
                },
              ),

              SizedBox(height: 8.0),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     onPressed: () {
              //       setState(() {
              //         preferences.add('');
              //       });
              //     },
              //     child: Text('Add Preference'),
              //   ),
              // ),
              SizedBox(height: 16.0),
              Text('Availability:'),
              for (int i = 0; i < timing.length; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(daysOfWeek[i]),
                    SizedBox(width: 8.0),
                    Checkbox(
                      value: timing[i][0],
                      onChanged: (value) {
                        setState(() {
                          timing[i][0] = value!;
                        });
                      },
                    ),
                    Text('AM'),
                    SizedBox(width: 8.0),
                    Checkbox(
                      value: timing[i][1],
                      onChanged: (value) {
                        setState(() {
                          timing[i][1] = value!;
                        });
                      },
                    ),
                    Text('PM'),
                  ],
                ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
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
                  // signUp();
                  final url =
                      'https://corp-u.herokuapp.com/createSessional'; // Replace with your API endpoint

                  final staffData = {
                    'name': name,
                    'email': email,
                    'password': password,
                    'preferences': preferences,
                    'qualification':qualification,
                    'contact':contact,
                    'timing': timing
                  };
                  print(staffData);

                  try {
                    final response = await http.post(
                      Uri.parse(url),
                      body: jsonEncode(staffData),
                      headers: {
                        'Content-Type': 'application/json',
                      },
                    );

                    if (response.statusCode == 200) {
                      print('Request successful');
                      print(response.body);
                      Navigator.pop(context);

                    } else {
                      print(
                          'Request failed with status: ${response.statusCode}');
                    }
                  } catch (error) {
                    print('Error: $error');
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() {
    // Implement your logic to save the sign-up details
    print('Name: $name');
    print('Email: $email');
    print('Password: $password');
    print('Contact: $contact');
    print('Qualification: $qualification');
    print('Preferences: $preferences');
    print('Availability: $timing');
  }
}
