import 'package:flutter/material.dart';
import 'home.dart';
import 'Signup.dart';
class Home_login_Page extends StatefulWidget {
  const Home_login_Page({super.key});

  @override
  State<Home_login_Page> createState() => _Home_login_PageState();
}

class _Home_login_PageState extends State<Home_login_Page> {
  
  bool _showpass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameErr = "User Name is invalid";
  var _passErr = "Password is invalid";
  var _usercheck = false;
  var _passcheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Title

            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
              decoration: BoxDecoration(),
              child: const Text(
              'Chào mừng bạn đến với \n TODO APP',
              style: TextStyle(fontFamily: 'Time New Roman', fontWeight: FontWeight.bold, color: Colors.black, fontSize: 31),
              textAlign: TextAlign.center,
              ),
            ),
            //Image
            Container(
              height:250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image:  AssetImage('Image/Bg_DB.jpeg')),
            )),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 237.0, 10.0),
              child: const Text (
                'Login',
                style: TextStyle(fontFamily: 'Time New Roman',fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                textAlign: TextAlign.left,
              ),
            ),
            //Login form
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: TextFormField(
              controller: _userController,
              decoration: InputDecoration(
                icon: const Icon(Icons.account_box_sharp, size: 27),
                errorText: _usercheck ? _userNameErr : null,
                labelText: 'User Name'
              ),
            ),
            ),
            
            Container (
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: <Widget> [
                TextFormField(
                  obscureText: !_showpass,
                  controller: _passController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.vpn_key, size: 27),
                    errorText: _passcheck ? _passErr : null,
                    labelText: 'Password'
                  ),
                ),
                GestureDetector(
                  onTap: OnToggleShowPass,
                  child:  Text( _showpass ? 'HIDE' : 'SHOW', style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Time New Roman', fontSize: 13, color: Colors.blue), textAlign: TextAlign.right),
                )
              ],
            ),
            ),
            
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child: ElevatedButton(
                      child: Text('SIGN IN'),
                      onPressed: OnClickedSignin,
                    ),
                  ),
                  Container (
                    padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child: ElevatedButton(
                      child: const Text('SIGN UP'),
                      onPressed: OnClickedSignup,
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

void OnToggleShowPass(){
  setState((){
    _showpass = !_showpass;
  });
}

void OnClickedSignin(){
  setState(() {
    if (_userController.text.length < 9){
      _usercheck = true;
    }
    else {
      _usercheck = false;
    }
    if (_passController.text.length < 6){
      _passcheck = true;
    }
    else {
      _passcheck = false;
    }
    if (!_usercheck && !_passcheck){
      Navigator.push(context, MaterialPageRoute(builder: GotoHome));
    }
  });
}

Widget GotoHome (BuildContext context){
  return HomePage();
}

void OnClickedSignup(){
  Navigator.push(context, MaterialPageRoute(builder: GotoSignup));
}

Widget GotoSignup (BuildContext context){
  return SignupPage();
}

}


