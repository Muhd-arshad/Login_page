import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/home.dart';
import 'package:whatsapp/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Image.asset('assets/images/whatsapp Splash.webp')],
        ),
      ),
    );
  }

  navigateToHome(BuildContext context) async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    var pref = await SharedPreferences.getInstance();
    var loggedin = pref.getBool('isLogged');
    loggedin == true
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
  }
}
