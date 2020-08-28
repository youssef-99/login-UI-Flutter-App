import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/account.dart';
import 'package:login/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  String users;
  checkUser ()async{
    SharedPreferences user = await SharedPreferences.getInstance();
    setState(() {
      users = user.getString('email');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      image: Image(image: AssetImage('assets/Artboard.png'), alignment: Alignment.bottomCenter,),
      backgroundColor: Colors.grey[200],
      photoSize: 200.0,
      loaderColor: Colors.blue[700],
      navigateAfterSeconds: users == null ? LogInPage() : MyAccount(),
    );
  }
}

