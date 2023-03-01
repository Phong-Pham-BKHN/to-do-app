import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      home: Home_login_Page(),
    );
  }
}

class Home_login_Page extends StatefulWidget {
  const Home_login_Page({super.key});

  @override
  State<Home_login_Page> createState() => _Home_login_PageState();
}

class _Home_login_PageState extends State<Home_login_Page> {
  
  final _formKey = GlobalKey<_Home_login_PageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Title
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 10.0),
              decoration: BoxDecoration(),
              child: Text(
              'Chào mừng bạn đến với \n TODO APP',
              style: TextStyle(fontFamily: 'Time New Roman', fontWeight: FontWeight.bold, color: Colors.black, fontSize: 31),
              textAlign: TextAlign.center,
              ),
            ),
            //Image
            Container(
              height:300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image:  AssetImage('/Users/apple/Documents/To_do_app_Project/to-do-app-1/project_1/Image/Bg_DB.jpeg')),
            )),
            //Select account
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 175.0, 10.0),
              child: Text(
                'Chọn tài khoản',
                style: TextStyle(fontFamily: 'Time New Roman', fontWeight: FontWeight.w300, fontSize: 17),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 237.0, 10.0),
              child: Text (
                'Login',
                style: TextStyle(fontFamily: 'Time New Roman',fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            //Login form
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.account_box_sharp, size: 27),
                hintText: 'Tên tài khoản',
                labelText: 'Tài khoản'
              ),
              validator: (value){
                if (value!.isNotEmpty){
                  return 'Nhập vào tài khoản';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.key, size: 27),
                hintText: 'Mật khẩu',
                labelText: 'Mật khẩu'
              ),
              validator: (value){
                if (value!.isNotEmpty){
                  return 'Nhập vào mật khẩu';
                }
                return null;
              }
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 5.0),
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: ElevatedButton(
                      child: Text('Sign In'),
                      onPressed: () {
                        //do some thing
                      },
                    ),
                  ),
                  Container (
                    margin: EdgeInsets.fromLTRB(60.0, 10.0, 60.0, 5.0),
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: ElevatedButton(
                      child: Text('Sign Up'),
                      onPressed: (){
                        //do some thing
                      },
                    ),
                  ),
                ]
              )
            ),
          ]
        )

         
        
      ),
    );
  }
}
