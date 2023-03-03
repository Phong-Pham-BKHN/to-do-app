import 'package:flutter/material.dart';

class myday_Page extends StatefulWidget {
  const myday_Page({super.key});

  @override
  State<myday_Page> createState() => _myday_PageState();
}

class _myday_PageState extends State<myday_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ngày hôm nay của tôi'),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}