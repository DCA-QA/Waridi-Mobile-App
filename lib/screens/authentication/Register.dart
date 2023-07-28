import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.75;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Image.asset(
          'assets/images/waridi.png',
          width: 150,
          height: 150,
        ),
        SizedBox(height: 40),
        Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        _buildTextField('Username', 'Enter your username'),
        SizedBox(height: 10),
        _buildTextField('Phone Number', 'Enter your phone number'),
        SizedBox(height: 10),
        _buildTextField('Email', 'Enter your email'),
        SizedBox(height: 10),
        _buildTextField('Password', 'Enter your password', isPassword: true),
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            // Perform registration action here
            print('Register button pressed');
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFFDF01), // Use FFDF01 color for the button
            minimumSize: Size(150, 40), // Set the button width
          ),
          child: Text('REGISTER'),
        ),
        SizedBox(height: 10),
            RichText(
                text: TextSpan(
              text: "Alredy have an account ? ",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Login",
                  style: TextStyle(color: Colors.red),
                  // Add onTap callback for the registration process here
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
                      // Handle register action here
                    },
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildTextField(String labelText, String placeholderText, {bool isPassword = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          hintText: placeholderText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
