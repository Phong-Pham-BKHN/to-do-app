import 'package:flutter/material.dart';

class changePassPage extends StatefulWidget {
  const changePassPage({super.key});

  @override
  State<changePassPage> createState() => _changePassPageState();
}

class _changePassPageState extends State<changePassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đổi mật khẩu'),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}