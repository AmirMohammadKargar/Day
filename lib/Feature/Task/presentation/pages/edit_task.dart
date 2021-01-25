import 'package:Day/core/utils/constans.dart';
import 'package:Day/core/widgets/custom_button.dart';
import 'package:Day/core/widgets/custom_text_input.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class EditTask extends StatefulWidget {
  EditTask({Key key}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

String dropdownValue = 'One';
TextEditingController _controller1;
String _valueChanged1 = '';
String _valueToValidate1 = '';
String _valueSaved1 = '';

class _EditTaskState extends State<EditTask> {
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
          translate("Task.EditTask.Head"),
          style: Theme.of(context).textTheme.headline2.copyWith(
                fontSize: size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.01,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: darkBlue,
              shape: BoxShape.circle,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(250),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(250),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: skyBlue,
                  size: size.width * 0.08,
                ),
              ),
            ),
          ),
        ),
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
                translate("Task.EditTask.Body"),
                style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: size.height * 0.03),
              TextInput(
                size: size,
                icon: Icons.title,
                text: translate("Task.EditTask.Title"),
              ),
              SizedBox(height: size.height * 0.02),
              TextInput(
                size: size,
                icon: Icons.description,
                text: translate("Task.EditTask.Description"),
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
                    labelText: translate("Task.EditTask.Time"),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      size: size,
                      color: deepBlue,
                      text: translate("Task.EditTask.Edit"),
                      height: size.height * 0.06,
                      width: size.width * 0.4,
                    ),
                    SizedBox(width: size.width * 0.01),
                    CustomButton(
                      size: size,
                      color: red,
                      text: translate("Task.EditTask.Delete"),
                      height: size.height * 0.06,
                      width: size.width * 0.4,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
