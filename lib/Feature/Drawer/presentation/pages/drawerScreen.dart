import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  List<Map> drawerItems = [
    {'icon': Icons.bookmark, 'title': 'Tasks'},
    {'icon': Icons.category, 'title': 'Categories'},
    {'icon': Icons.add, 'title': 'Add new task'},
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: deepBlue,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Container(
            width: size.width * 0.5,
            child: Text(
              "Olivia Micheal",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(fontSize: size.width * 0.08),
            ),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Column(children: [
            RowIconTextButton(size: size, icon: Icons.bookmark, text: 'Task'),
            SizedBox(
              height: size.height * 0.01,
            ),
            RowIconTextButton(
                size: size, icon: Icons.category, text: 'Category'),
            SizedBox(
              height: size.height * 0.01,
            ),
            RowIconTextButton(
              size: size,
              icon: Icons.add,
              text: 'Add new Task',
              onPress: () {
                Navigator.pushNamed(context, "/AddTask");
              },
            )
          ]),
          SizedBox(
            height: size.height * 0.2,
          ),
          Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Settings',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Log out',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RowIconTextButton extends StatelessWidget {
  const RowIconTextButton({
    Key key,
    @required this.size,
    this.icon,
    this.text,
    this.onPress,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onPress();
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: skyBlue,
              size: size.width * 0.08,
            ),
            Text(
              "$text",
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(fontSize: size.width * 0.04),
            )
          ],
        ),
      ),
    );
  }
}
