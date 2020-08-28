import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/loginPage.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  File _image;
  final picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            profilePic(),
            SizedBox(height: 10.0),
            Text(
              'Youssef William',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () async{
                SharedPreferences users = await SharedPreferences.getInstance();
                users.clear();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage()));
              },
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 55),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(
                'Sign Out',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  profilePic() => CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 100.0,
        child: _image == null
            ? IconButton(
                onPressed: () {
                  getImage();
                },
                icon: Icon(
                  Icons.camera_alt,
                  size: 40,
                ),
              )
            : Image.file(
                _image,
                fit: BoxFit.fill,
              ),
      );


  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
}
