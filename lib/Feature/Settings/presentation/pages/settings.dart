import 'package:Day/core/utils/constans.dart';
import 'package:Day/core/widgets/back_button.dart';
import 'package:Day/core/widgets/custom_button.dart';
import 'package:Day/core/widgets/custom_circle_avatar.dart';
import 'package:Day/core/widgets/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

String dropdownValue = 'One';
TextEditingController _controller1;
String _valueChanged1 = '';
String _valueToValidate1 = '';
String _valueSaved1 = '';

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          translate("Settings.Settings.Head"),
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: CustomBackButton(size: size),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: <Widget>[
                Center(
                  child: CustomCircleAvatar(size: size),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                TextInput(
                  icon: Icons.person,
                  text: translate("Settings.Settings.Name"),
                  size: size,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextInput(
                  icon: Icons.person,
                  text: translate("Settings.Settings.LastName"),
                  size: size,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextInput(
                  icon: Icons.email,
                  text: translate("Settings.Settings.Email"),
                  size: size,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: darkBlue,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: darkBlue,
                        blurRadius: 20.0,
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      dropdownColor: blue,
                      elevation: 16,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: skyBlue,
                        size: size.width * 0.08,
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: skyBlue),
                      underline: Container(
                        height: 2,
                        color: darkBlue,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage("assets/images/en.png"),
                                width: size.width * 0.08,
                              ),
                              SizedBox(width: size.width * 0.03),
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomButton(
                      size: size,
                      width: size.width * 0.4,
                      height: size.height * 0.06,
                      color: deepBlue,
                      text: translate("Settings.Settings.Confirm"),
                    ),
                    SizedBox(width: size.width * 0.03),
                    CustomButton(
                      size: size,
                      width: size.width * 0.4,
                      height: size.height * 0.06,
                      color: deepBlue,
                      text: translate("Settings.Settings.Change"),
                      fontSize: size.width * 0.04,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
