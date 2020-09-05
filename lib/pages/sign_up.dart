import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/widgets/confirm_button.dart';
import 'package:login/widgets/text_form_field.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameCnt = TextEditingController();
  TextEditingController emailCnt = TextEditingController();
  TextEditingController passCnt = TextEditingController();
  TextEditingController confirmPassCnt = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  deviceSize(String type){
    MediaQuery.of(context).size.height;
    if(type == 'height')
      return MediaQuery.of(context).size.height;
    return MediaQuery.of(context).size.width;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          form(),
          signUpWith()
        ],
      ),
    );
  }
  form() => Container(
    height: deviceSize('height') * 0.70,
    padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
    margin: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
        color: Colors.white,
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFField(nameCnt, 'Enter your name', 'Enter name', Icons.perm_identity),
          TextFField(emailCnt, 'Enter your email', 'Enter email', Icons.email),
          TextFField(passCnt, 'Enter your password', 'Enter password', Icons.lock, secure: true),
          TextFField(confirmPassCnt, 'the password don\'t match', 'Confirm password', Icons.lock, secure: true),
          ConfirmButton(_formKey, emailCnt, passCnt, 'Sign up')
        ],
      ),
    ),
  );
  signUpWith() => Container(
    height: deviceSize('height')*0.25,
    child: Column(

      children: <Widget>[
        Text('OR',
            style: TextStyle(
              height: 1,
              decoration: TextDecoration.underline,
              color: Colors.white,
              fontSize: 20,
            )),
        Text('Sign up with',
            style: TextStyle(
              height: 3,
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
