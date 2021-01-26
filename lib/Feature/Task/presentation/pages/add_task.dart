import 'package:Day/core/utils/constans.dart';
import 'package:Day/core/widgets/back_button.dart';
import 'package:Day/core/widgets/custom_button.dart';
import 'package:Day/core/widgets/custom_text_input.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AddTask extends StatefulWidget {
  AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

String dropdownValue = 'One';
TextEditingController _controller1;
String _valueChanged1 = '';
String _valueToValidate1 = '';
String _valueSaved1 = '';

class _AddTaskState extends State<AddTask> {
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
          translate("Task.AddTask.Head"),
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: CustomBackButton(size: size),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage("assets/images/Task.png"),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                translate("Task.AddTask.Body"),
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: size.height * 0.03),
              TextInput(
                size: size,
                icon: Icons.title,
                text: translate("Task.AddTask.Title"),
              ),
              SizedBox(height: size.height * 0.02),
              TextInput(
                size: size,
                icon: Icons.description,
                text: translate("Task.AddTask.Description"),
              ),
              SizedBox(height: size.height * 0.02),
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
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
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
                            Container(
                              width: size.width * 0.1,
                              height: size.height * 0.03,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: pink,
                                  width: size.width * 0.005,
                                ),
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
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
                child: DateTimePicker(
                  type: DateTimePickerType.dateTime,
                  dateMask: 'd MMMM, yyyy - hh:mm a',
                  controller: _controller1,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: skyBlue,
                    ),
                    border: InputBorder.none,
                    labelText: translate("Task.AddTask.Time"),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: skyBlue),
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: skyBlue),
                  selectableDayPredicate: (date) {
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }
                    return true;
                  },
                  onChanged: (val) => setState(() => _valueChanged1 = val),
                  validator: (val) {
                    setState(() => _valueToValidate1 = val);
                    return null;
                  },
                  onSaved: (val) => setState(() => _valueSaved1 = val),
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Center(
                child: CustomButton(
                  size: size,
                  text: translate("Task.AddTask.Add"),
                  height: size.height * 0.06,
                  width: size.width * 0.7,
                  color: deepBlue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
