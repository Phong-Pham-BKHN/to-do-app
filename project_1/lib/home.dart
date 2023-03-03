import 'package:flutter/material.dart';
import 'dart:io';

import 'login.dart';
import 'importantpage.dart';
import 'mydaypage.dart';
import 'planedpage.dart';
import 'mywork.dart';
import 'task.dart';
import 'account_info.dart';
import 'changepass.dart';
import 'moreinfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Chủ'),
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: Colors.green[100],
      
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
            accountName: Text('Phạm Hải Phong', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Time New Roman", fontSize: 20)),
            accountEmail: Text('admin@admin.com', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Time New Roman", fontSize: 15)),
            currentAccountPicture: CircleAvatar(backgroundImage: AssetImage('Image/ava.jpeg')),          
            decoration: BoxDecoration(color: Colors.green[700]),
          ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Thông tin tài khoản'),
              onTap: myacc,
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('Đổi mật khẩu'),
              onTap: changepass,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Thông tin thêm'),
              onTap: moreinfo,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Đăng xuất'),
              onTap: exit,
            ),
          ]
        )
      ),

      body: Scaffold(
        body: Center(
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget> [
          // Widget card để tạo khu vực hình chữ nhật có 4 góc tròn và hiệu ứng bóng đổ
          Card (
            margin: EdgeInsets.fromLTRB(30.0, 30.0, 15.0, 15.0),
            //inkWell là widget để tạo hiệu ứng phản hồi cử chỉ
            child: InkWell(
              onTap: myDay,
              splashColor: Colors.green,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.sunny, size: 60.0, ),
                    Text('Ngày của Tôi',style: TextStyle(fontFamily: "Time New Roman", fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ),
          
          Card (
            margin: EdgeInsets.fromLTRB(15.0, 30.0, 30.0, 15.0),
            //inkWell là widget để tạo hiệu ứng phản hồi cử chỉ
            child: InkWell(
              onTap: importantHomePage,
              splashColor: Colors.green,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.star, size: 60.0, ),
                    Text('Quan trọng',style: TextStyle(fontFamily: "Time New Roman", fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ),
          
          Card (
            margin: EdgeInsets.fromLTRB(30.0, 30.0, 15.0, 15.0),
            //inkWell là widget để tạo hiệu ứng phản hồi cử chỉ
            child: InkWell(
              onTap: myPlaned,
              splashColor: Colors.green,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.calendar_month, size: 60.0, ),
                    Text('Đã lập kế hoạch',style: TextStyle(fontFamily: "Time New Roman", fontSize: 19.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  ],
                ),
              ),
            )
          ),
          
          Card (
            margin: EdgeInsets.fromLTRB(15.0, 30.0, 30.0, 15.0),
            //inkWell là widget để tạo hiệu ứng phản hồi cử chỉ
            child: InkWell(
              onTap: myWork,
              splashColor: Colors.green,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.man_2, size: 60.0, ),
                    Text('Đã giao cho tôi',style: TextStyle(fontFamily: "Time New Roman", fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ),

          Card (
            margin: EdgeInsets.fromLTRB(30.0, 30.0, 15.0, 15.0),
            //inkWell là widget để tạo hiệu ứng phản hồi cử chỉ
            child: InkWell(
              onTap: myTask,
              splashColor: Colors.green,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.home, size: 60.0, ),
                    Text('Tác vụ',style: TextStyle(fontFamily: "Time New Roman", fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ),
        ]
      ),
    )
      ),
    );
  }

void importantHomePage(){
    Navigator.push(context, MaterialPageRoute(builder: gotoimportant)); //Sửa lại hàm context
  }

Widget gotoimportant(BuildContext context){
  return Important_Page();
}

void myDay(){
    Navigator.push(context, MaterialPageRoute(builder: gotomyDay)); //Sửa lại hàm context
  }

Widget gotomyDay(BuildContext context){
  return myday_Page();
}

void myPlaned(){
    Navigator.push(context, MaterialPageRoute(builder: gotomyplaned)); //Sửa lại hàm context
  }

Widget gotomyplaned(BuildContext context){
  return planed_Page();
}

void myWork(){
    Navigator.push(context, MaterialPageRoute(builder: gotomywork)); //Sửa lại hàm context
  }

Widget gotomywork(BuildContext context){
  return myWork_Page();
}

void myTask(){
    Navigator.push(context, MaterialPageRoute(builder: gotomytask)); //Sửa lại hàm context
  }

Widget gotomytask(BuildContext context){
  return myTask_Page();
}

void myacc(){
    Navigator.push(context, MaterialPageRoute(builder: gotomyacc)); //Sửa lại hàm context
  }

Widget gotomyacc(BuildContext context){
  return MyAccountPage();
}

void changepass(){
    Navigator.push(context, MaterialPageRoute(builder: gotomychangepass)); //Sửa lại hàm context
  }

Widget gotomychangepass(BuildContext context){
  return changePassPage();
}

void moreinfo(){
    Navigator.push(context, MaterialPageRoute(builder: gotomymoreinfo)); //Sửa lại hàm context
  }

Widget gotomymoreinfo(BuildContext context){
  return moreInfoPage();
}

exit() async{
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_login_Page()));
}

}




