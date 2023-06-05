import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/SignScreen.dart';
import 'screens/details.dart';

void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff0c2f47),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: details(),

    );
  }
}






