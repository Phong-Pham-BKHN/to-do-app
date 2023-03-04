
import 'package:flutter/material.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _showpass = false;
  bool _showconfirmpass = false;

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _confirmpassController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();

  var _userNameErr = "User Name needs to be more than 9 characters";
  var _passErr = "Password needs to be more than 6 characters";
  var _confirmpassErr = "Incorrect password";
  var _emailErr = "Incorrect emai";
  var _usercheck = false;
  var _passcheck = false;
  var _confirmpasscheck = false;
  var _emailcheck = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Stack(
        children: [
          //background
          Stack(
            children: <Widget>[
              Stack(
                //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                children: [
                  Container(
                      width: w,
                      height: h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('Image/Bg_SU.jpeg'),
                            fit: BoxFit.cover),
                      )),
                ],
              )
            ],
          ),

          //form
          Wrap(children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(w * 0.05, h * 0.2, w * 0.05, h * 0.2),
              width: w,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.mail, size: 27),
                        errorText: _emailcheck ? _emailErr : null,
                        labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _userController,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.account_box_sharp, size: 27),
                        errorText: _usercheck ? _userNameErr : null,
                        labelText: 'User Name'),
                  ),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextFormField(
                        obscureText: !_showpass,
                        controller: _passController,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.vpn_key, size: 27),
                            errorText: _passcheck ? _passErr : null,
                            labelText: 'Password'),
                      ),
                      GestureDetector(
                        onTap: OnToggleShowPass,
                        child: Text(_showpass ? 'HIDE' : 'SHOW',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Time New Roman',
                                fontSize: 13,
                                color: Colors.blue),
                            textAlign: TextAlign.right),
                      )
                    ],
                  ),
                  Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        TextFormField(
                          obscureText: !_showconfirmpass,
                          controller: _confirmpassController,
                          decoration: InputDecoration(
                              icon: const Icon(Icons.vpn_key, size: 27),
                              errorText:
                                  _confirmpasscheck ? _confirmpassErr : null,
                              labelText: 'Confirm password'),
                        ),
                        GestureDetector(
                          onTap: OnToggleShowConfirmPass,
                          child: Text(_showconfirmpass ? 'HIDE' : 'SHOW',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Time New Roman',
                                  fontSize: 13,
                                  color: Colors.blue),
                              textAlign: TextAlign.right),
                        ),
                      ]),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      width: w * 0.8,
                      height: h * 0.05,
                      child: ElevatedButton(
                        onPressed: OnSignupClicked,
                        child: Text("SIGN UP"),
                      )),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }

  void OnToggleShowPass() {
    setState(() {
      _showpass = !_showpass;
    });
  }

  void OnToggleShowConfirmPass() {
    setState(() {
      _showconfirmpass = !_showconfirmpass;
    });
  }

  void OnSignupClicked() {
    setState(() {
      //Email check
      if (_emailController.text.length < 6 ||
          !_emailController.text.contains("@")) {
        _emailcheck = true;
      } else {
        _emailcheck = false;
      }
      //User check
      if (_userController.text.length < 9) {
        _usercheck = true;
      } else {
        _usercheck = false;
      }
      //Password check
      if (_passController.text.length < 6) {
        _passcheck = true;
      } else {
        _passcheck = false;
      }
      //Confirm password check
      if (_confirmpassController.text.characters !=
          _passController.text.characters) {
        _confirmpasscheck = true;
      } else {
        _confirmpasscheck = false;
      }
      //Done check
      if (!_usercheck && !_passcheck && !_confirmpasscheck && !_emailcheck) {
        var mySnackBar = SnackBar(
          content: Text('Signed up, please login'),
          duration: Duration(milliseconds: 1000),
        );
        ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
        Navigator.push(context, MaterialPageRoute(builder: Gotologinpage));
        backgroundColor:
        Colors.white;
      }
    });
  }

  Widget Gotologinpage(BuildContext context) {
    return Home_login_Page();
  }
}
