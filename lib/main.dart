import 'package:flutter/material.dart';
import 'screens/home_page.dart';

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
      home: HomePage(),
    );
  }
}
