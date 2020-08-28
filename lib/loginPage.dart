import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCnt = TextEditingController();
  TextEditingController passCnt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[form(), singUpScenario()],
      ),
    );
  }

  form() => Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        width: 400,
        height: 400,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 30.0, bottom: 10.0),
                child: TextFormField(
                  controller: emailCnt,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email!';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email, color: Colors.black),
                    labelText: 'Enter email',
                    labelStyle: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, bottom: 20.0),
                child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your password!';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock, color: Colors.black),
                        labelText: 'Enter password',
                        labelStyle: TextStyle(fontSize: 20.0))),
              ),
              Container(
                margin: EdgeInsets.only(top: 0.0),
                height: 75,
                width: 180,
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.blue[900].withOpacity(1),
                      blurRadius: 25,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: RaisedButton(
                  onPressed: () async{
                    if (_formKey.currentState.validate()) {
                      SnackBar(
                        content: const Text(
                          'Submitting...',
                        ),
                        backgroundColor: Colors.grey,
                        duration: Duration(seconds: 1),
                      );
                      SharedPreferences users = await SharedPreferences.getInstance();
                      users.setString('email', emailCnt.text);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyAccount()));
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 10,
                ),
              ),
              InkWell(
                onTap: (){},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      );

  singUpScenario() => Container(
    padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
    height: 240,
    child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Not have account?',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 55),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                'SignUp',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text('OR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                iconWidget(FontAwesomeIcons.facebookF),
                iconWidget(FontAwesomeIcons.instagram),
                iconWidget(FontAwesomeIcons.github),
                iconWidget(FontAwesomeIcons.google),
              ],
            )
          ],
        ),
  );

  iconWidget(IconData icon) => InkWell(
          onTap: () {},
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                icon,
                size: 30,
                color: Colors.blue,
              ),
            ),
          ),
      );
}
