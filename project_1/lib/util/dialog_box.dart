import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return AlertDialog(
      content: Container(
          height: h * 0.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Thêm công việc mới',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  MaterialButton(
                    onPressed: onSave,
                    color: Theme.of(context).primaryColor,
                    child: Text('Save'),
                  ),

                  const SizedBox(width: 30),

                  //cancel button
                  MaterialButton(
                    onPressed: onCancel,
                    color: Theme.of(context).primaryColor,
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
