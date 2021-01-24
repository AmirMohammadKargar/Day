import 'package:Day/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.12),
            Center(
              child: Image(
                image: AssetImage("assets/images/Walkthrough.png"),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              translate("Login.Walkthrough.Head"),
              style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              translate("Login.Walkthrough.Body"),
              style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: size.width * 0.03,
                  ),
            ),
            SizedBox(height: size.height * 0.08),
            CustomButton(
              size: size,
              width: size.width * 0.85,
              height: size.height * 0.075,
              text: translate("Login.Walkthrough.Button"),
              onPress: () {
                Navigator.pushNamed(context, '/SignUp');
              },
            ),
          ],
        ),
      )),
    );
  }
}
