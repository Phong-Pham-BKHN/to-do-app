import 'package:flutter/material.dart';

class Important_Page extends StatefulWidget {
  const Important_Page({super.key});

  @override
  State<Important_Page> createState() => _Important_PageState();
}

class _Important_PageState extends State<Important_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Công việc quan trọng'),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}