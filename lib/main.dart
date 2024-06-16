import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      debugShowCheckedModeBanner: false, // Supprime le badge de débogage
      home: RegistrationScreen(),
    );
  }
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background color for the Scaffold
      body: Column(
        children: [
          // Top part of your existing 'home.dart' code
          Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              alignment: Alignment.bottomLeft, // Align to the bottom left
              height: 190,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CREATE",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 5), // Add some space
                      Text(
                        "YOUR ACCOUNT",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Enter your email account and your password",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                       SizedBox(height: 5), 
                       Text(
                        "to create your account",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ],
                  ),
                  // ... rest of your existing code ...
                ],
              )),
          const SizedBox(
            height: 25,
          ),
          // ... rest of your 'home.dart' code ...

          // Your registration form
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      prefixIcon: Icon(Icons.person), // Add a person icon
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      prefixIcon: Icon(Icons.email), // Add an email icon
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      prefixIcon: Icon(Icons.lock), // Add a lock icon
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      prefixIcon: Icon(Icons.lock), // Add a lock icon
                    ),
                    obscureText: true,
                    //                validator: (value) {
                    //   if (value == null || value.isEmpty || value != _password) {
                    //     print('_password: $_password');
                    //     print('value: $value');
                    //     return 'Passwords do not match';
                    //   }
                    //   return null;
                    // },
                    // onSaved: (value) {
                    //   _confirmPassword = value!;
                    // },
                  ),
                  SizedBox(height: 32.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Here, you can add the logic to submit the form data
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                          print('Name: $_name');
                          print('Email: $_email');
                          print('Password: $_password');
                          print(
                              'Confirm Password: $_confirmPassword'); // This line is not used in your code, so I've commented it out
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 150.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text('S inscrire'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}