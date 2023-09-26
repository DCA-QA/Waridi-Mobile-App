import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Register.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(height: 20),
        _buildTextField('Email', false),
        SizedBox(height: 10),
        _buildTextField('Password', true),
        SizedBox(height: 10),
        _buildForgotPassword(),
        SizedBox(height: 80),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Perform login action here
                print('Login button pressed');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFDF01), // Use FFDF01 color for the button
                minimumSize: Size(150, 40), // Set the button width
              ),
              child: Text('LOGIN'),
            ),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Register",
                  style: TextStyle(color: Colors.red),
                  // Add onTap callback for the registration process here
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(
                        context,
                        '/login',
                      );
                      // Handle register action here
                    },
                ),
              ],
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String labelText, bool isPassword) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
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

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        // Handle forgot password action here
        print('Forgot Password tapped');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerRight,
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
