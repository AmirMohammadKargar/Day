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
          Column(
            children: drawerItems
                .map((element) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            element['icon'],
                            color: skyBlue,
                            size: size.width * 0.07,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            element['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
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
