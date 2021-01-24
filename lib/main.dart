import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Day',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: size.width * 0.08, color: white),
          headline2: TextStyle(fontSize: size.width * 0.06, color: white),
          button: TextStyle(fontSize: size.width * 0.04, color: white),
          body1: TextStyle(fontSize: size.width * 0.03, color: white),
          body2: TextStyle(fontSize: size.width * 0.045, color: white),
          headline3: TextStyle(
              fontSize: size.width * 0.03,
              color: skyBlue,
              fontFamily: 'Montserrat'),
        ),
      ),
    );
  }
}
