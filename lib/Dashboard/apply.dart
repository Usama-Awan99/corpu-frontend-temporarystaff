import 'package:flutter/material.dart';
import 'applicant.dart';
import 'course_unit.dart';

class ApplyScreen extends StatefulWidget {
  final CourseUnit courseUnit;

  const ApplyScreen({required this.courseUnit});

  @override
  _ApplyScreenState createState() =>
      _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _educationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseUnit.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Education',
                  border: OutlineInputBorder(),
                ),
                controller: _educationController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your education';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              // Add other form fields here
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the form
                    _formKey.currentState!.save();

                    // Create a new applicant object with the entered details
                    Applicant newApplicant = Applicant(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      email: _emailController.text,
                      education: _educationController.text,
                      // Add other fields here
                    );

                    // Add the new applicant to the list of applicants for this course unit
                    //widget.courseUnit.applicants.add(newApplicant);

                    // Show a snackbar to confirm that the applicant has been added
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Application submitted successfully'),
                      ),
                    );

                    // Navigate back to the course unit list screen
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
