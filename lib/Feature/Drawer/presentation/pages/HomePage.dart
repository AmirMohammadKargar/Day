import 'package:Day/Feature/Drawer/presentation/pages/drawerScreen.dart';
import 'package:Day/Feature/Home/presentation/pages/Home.dart';

import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MyHomePage(),
            Home(),
          ],
        ),
      ),
    );
  }
}
