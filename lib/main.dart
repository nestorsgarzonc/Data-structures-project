import 'package:ed_project/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import './screens/authentication/login_page.dart';
import './screens/authentication/register_page.dart';
import 'screens/initial_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFFE94832),
        buttonColor: const Color(0xFFE94832),
      ),
      initialRoute: InitialPage.route,
      routes: {
        InitialPage.route: (ctx) => InitialPage(),
        RegisterPage.route: (ctx) => RegisterPage(),
        LoginPage.route: (ctx) => LoginPage(),
        HomePage.route: (ctx) => HomePage(),
      },
    );
  }
}
