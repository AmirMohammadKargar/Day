import 'package:Day/core/utils/constans.dart';
import 'package:Day/core/widgets/custom_button.dart';
import 'package:Day/core/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.03,
                ),
                Center(
                  child: Text(
                    translate("Login.SignIn.Head"),
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.07,
                ),
                Image(
                  image: AssetImage("assets/images/SignIn.png"),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                TextInput(
                  icon: Icons.email,
                  size: size,
                  text: translate("Login.SignIn.Email"),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextInput(
                  icon: Icons.lock,
                  size: size,
                  text: translate("Login.SignIn.Password"),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomButton(
                  size: size,
                  text: translate("Login.SignIn.SignIn"),
                  color: deepBlue,
                  height: size.height * 0.07,
                  onPress: () {
                    Navigator.pushNamed(context, "/Home");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
