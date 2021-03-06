import 'package:Day/Feature/Drawer/presentation/pages/HomePage.dart';
import 'package:Day/Feature/Login/presentation/pages/sign_in.dart';
import 'package:Day/Feature/Login/presentation/pages/sign_up.dart';
import 'package:Day/Feature/Login/presentation/pages/walkthrough.dart';
import 'package:Day/Feature/Settings/presentation/pages/settings.dart';
import 'package:Day/Feature/Task/presentation/pages/Add_Task.dart';
import 'package:Day/Feature/Task/presentation/pages/all_task.dart';
import 'package:Day/Feature/Task/presentation/pages/edit_task.dart';
import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;

LocalizationDelegate delegate;
void main() async {
  await di.init();
  delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: [
      'en_US',
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SharedPreferences sharedPreferences;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Day',
      theme: ThemeData(
        scaffoldBackgroundColor: blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 25,
            color: white,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(fontSize: 20, color: white),
          button: TextStyle(fontSize: 15, color: white),
          bodyText1: TextStyle(fontSize: 13, color: white),
          bodyText2: TextStyle(fontSize: 15, color: white),
          headline3: TextStyle(
            fontSize: 16,
            color: skyBlue,
            fontFamily: 'Montserrat',
            letterSpacing: 2,
          ),
        ),
      ),
      initialRoute:
          sharedPreferences.getBool("ISLOGGED") == true ? '/Home' : '/',
      routes: {
        '/': (context) => Walkthrough(),
        '/SignUp': (context) => SignUp(),
        '/SignIn': (context) => SignIn(),
        '/Home': (context) => DrawerScreen(),
        '/AddTask': (context) => AddTask(),
        '/EditTask': (context) => EditTask(),
        '/AllTask': (context) => AllTask(),
        "/Settings": (context) => Settings(),
      },
    );
  }
}
