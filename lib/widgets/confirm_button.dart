import 'package:flutter/material.dart';
import 'package:login/pages/account.dart';
import 'package:login/pages/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmButton extends StatefulWidget {
  final formKey;
  final TextEditingController emailCnt;
  final TextEditingController passCnt;
  final String label;
  ConfirmButton(this.formKey, this.emailCnt, this.passCnt, this.label);
  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          if (widget.formKey.currentState.validate()) {
            SnackBar(
              content: const Text(
                'Submitting...',
              ),
              backgroundColor: Colors.grey,
              duration: Duration(seconds: 1),
            );
            SharedPreferences users = await SharedPreferences.getInstance();
            users.setString('email', widget.emailCnt.text);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLocation()));
          }
        },
        child: Text(
          widget.label,
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
    );
  }
}