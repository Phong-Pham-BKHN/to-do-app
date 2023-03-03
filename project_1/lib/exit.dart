import 'package:flutter/material.dart';
import 'dart:io';

class exit_app extends StatefulWidget {
  const exit_app({super.key});

  @override
  State<exit_app> createState() => _exit_appState();
}

class _exit_appState extends State<exit_app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thoát'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed:() => exit(0),
            tooltip: 'Close App',
          ),
        )

      ),
    );
  }
}