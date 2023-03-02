import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Sign Up')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Image.asset('/Users/apple/Documents/To_do_app_Project/project_1/Image'),
            Container(

            ),
          ]
        ),
      ),
    );
  }
}
