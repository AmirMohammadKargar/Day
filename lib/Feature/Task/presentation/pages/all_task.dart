import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AllTask extends StatefulWidget {
  AllTask({Key key}) : super(key: key);

  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
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
          translate("Task.AllTask.Head"),
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
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
