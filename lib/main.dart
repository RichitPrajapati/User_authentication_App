import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_authentication_app/Home_Page.dart';
import 'package:user_authentication_app/Login_Page.dart';
import 'package:user_authentication_app/Welcome_Page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isRemembered = prefs.getBool('isRemembered') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isRemembered == false) ? 'login_register' : 'welcome_page',
      routes: {
        'homepage': (context) => const HomePage(),
        'login_register': (context) => const LoginRegister(),
        'welcome_page': (context) => const WelcomePage(),
      },
    ),
  );
}
