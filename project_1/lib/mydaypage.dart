import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_1/util/dialog_box.dart';

import 'data/database.dart';
import 'util/todo_tile.dart';

class myday_Page extends StatefulWidget {
  const myday_Page({super.key});

  @override
  State<myday_Page> createState() => _myday_PageState();
}

class _myday_PageState extends State<myday_Page> {
  final _myBox = Hive.box('My Box');

  ToDoDataBase db = ToDoDataBase();

  void initState() {
    //Nếu là lần đầu khởi tạo data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _taskController = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    DateTime today = new DateTime.now();
    String date = today.toString().substring(0, 10);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ngày hôm nay của tôi'),
        backgroundColor: Colors.green[700],
      ),
      body: Stack(
        children: <Widget>[
          Stack(
            children: [
              Container(
                  width: w,
                  height: h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('Image/Bg_04.jpg'),
                        fit: BoxFit.cover),
                  )),
            ],
          ),
          Wrap(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: h * 0.03, left: w * 0.03),
                width: w,
                height: h * 0.05,
                child: const Text(
                  'Ngày của Tôi',
                  style: TextStyle(
                      fontFamily: 'Time New Roman',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: w * 0.03),
                width: w,
                height: h * 0.025,
                child: Text(
                  '${date}',
                  style: const TextStyle(
                      fontFamily: 'Time New Roman',
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),

              //hiển thị danh sách công việc trong ngày
              Container(
                width: w,
                height: h * 0.65,
                child: ListView.builder(
                  itemCount: db.toDoList.length,
                  itemBuilder: (context, index) {
                    return ToDoTile(
                      taskCompleted: db.toDoList[index][1],
                      taskName: db.toDoList[index][0],
                      onChanged: (value) => checkBoxChanged(value, index),
                      deleteFunction: (context) => deleteTask(index),
                    );
                  },
                ),
              ),

              //Nút thêm tác vụ
              Container(
                margin: EdgeInsets.fromLTRB(w * 0.1, 0.0, w * 0.1, 0.0),
                width: w * 0.8,
                height: h * 0.05,
                child: FloatingActionButton.extended(
                    onPressed: createTask,
                    backgroundColor: Color.fromARGB(255, 152, 151, 151),
                    icon: const Icon(
                      Icons.add,
                    ),
                    label: const Text(
                      'Thêm tác vụ',
                      style: TextStyle(
                          fontFamily: 'Time New Roman',
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_taskController.text, false]);
      _taskController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _taskController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
}
