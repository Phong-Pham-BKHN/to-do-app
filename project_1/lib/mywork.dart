import 'package:flutter/material.dart';

class myWork_Page extends StatelessWidget {
  const myWork_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Công việc đã giao cho tôi'),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}