import 'package:Day/core/utils/constans.dart';
import 'package:Day/core/widgets/custom_button.dart';
import 'package:Day/core/widgets/custom_circle_button.dart';
import 'package:Day/core/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.08),
              Center(
                child: Text(
                  translate("Login.SignUp.Head"),
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * 0.3,
                height: size.height * 0.2,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundColor: skyBlue.withOpacity(0.5),
                    ),
                    Positioned(
                      top: size.height * 0.14,
                      right: size.width * 0.02,
                      child: CustomCircleButton(
                        size: size,
                        width: size.width * 0.1,
                        height: size.height * 0.05,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              TextInput(
                size: size,
                icon: Icons.person,
                text: translate("Login.SignUp.Name"),
              ),
              SizedBox(height: size.height * 0.02),
              TextInput(
                size: size,
                icon: Icons.person,
                text: translate("Login.SignUp.LastName"),
              ),
              SizedBox(height: size.height * 0.02),
              TextInput(
                size: size,
                icon: Icons.email,
                text: translate("Login.SignUp.Email"),
              ),
              SizedBox(height: size.height * 0.02),
              TextInput(
                size: size,
                icon: Icons.lock,
                text: translate("Login.SignUp.Password"),
              ),
              SizedBox(height: size.height * 0.02),
              TextInput(
                size: size,
                icon: Icons.lock,
                text: translate("Login.SignUp.ConfirmPassword"),
              ),
              SizedBox(height: size.height * 0.07),
              CustomButton(
                size: size,
                width: size.width * 0.8,
                height: size.height * 0.07,
                text: translate("Login.SignUp.Confirm"),
                onPress: () {
                  Navigator.pushNamed(context, '/Home');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
