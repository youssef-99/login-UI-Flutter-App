import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/pages/account.dart';
import 'package:login/pages/sign_up.dart';
import 'package:login/widgets/confirm_button.dart';
import 'package:login/widgets/text_form_field.dart';
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
              TextFField(emailCnt,'Please enter your email!', 'Enter email', Icons.email),
              TextFField(passCnt,'Please enter your password!', 'Enter password', Icons.lock),
              ConfirmButton(_formKey, emailCnt, passCnt, 'Login'),
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
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
