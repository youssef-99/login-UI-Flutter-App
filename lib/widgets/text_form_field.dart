import 'package:flutter/material.dart';
import 'package:login/pages/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFField extends StatefulWidget {
  final TextEditingController cnt;
  final String msg;
  final String label;
  final IconData iconData;
  final bool secure;
  TextFField(this.cnt, this.msg, this.label, this.iconData, {this.secure});
  @override
  _TextFFieldState createState() => _TextFFieldState();
}

class _TextFFieldState extends State<TextFField> {
  String _pass = '.+-*/';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, bottom: 10.0),
      child: TextFormField(
        controller: widget.cnt,
        validator: (value) {
          return validate(value);
        },
        obscureText: widget.secure == null ? false : true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(widget.iconData, color: Colors.black),
          labelText: widget.label,
          labelStyle: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }

  setPass() async{
      SharedPreferences user = await SharedPreferences.getInstance();
      user.setString('password', widget.cnt.text);
  }

  getPass() async{
    SharedPreferences user = await SharedPreferences.getInstance();
    setState(() {
      _pass = user.getString('password');
    });
  }

  validate(String value)  {
    if (widget.label == 'Enter email') {
      String email = value;
      int idxAt = email.indexOf('@');
      int idxCom = email.indexOf('.com');
      if (!email.contains('@') || !email.contains('.com') ||
          idxCom - idxAt <= 1 || idxAt == 0) {
        return widget.msg;
      }
      return null;
    }
    else if (widget.label == 'Enter name') {
      if (widget.cnt.text.isEmpty)
        return widget.msg;
      return null;
    }
    else if (widget.label == 'Enter password') {
      bool b = false;
      if (widget.cnt.text.length < 8)
        return 'Password has to be 8 characters at least';
      String pass = widget.cnt.text;
      for (int i = 0; i < pass.length; ++i) {
        if (pass.codeUnitAt(i) >= 65 && pass.codeUnitAt(i) <= 90)
          b = true;
      }
      if (!b)
        return 'Password has to contain upper case letters';
      setPass();
    }
    else {
      print (_pass);
      getPass();
      if(_pass.isNotEmpty)
        if (widget.cnt.text.isEmpty || widget.cnt.text.compareTo(_pass) != 0)
          return widget.msg;
    }
  }
}
