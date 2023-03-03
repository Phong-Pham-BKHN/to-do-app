import 'package:flutter/material.dart';

class moreInfoPage extends StatefulWidget {
  const moreInfoPage({super.key});

  @override
  State<moreInfoPage> createState() => _moreInfoPageState();
}

class _moreInfoPageState extends State<moreInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin thêm'),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}