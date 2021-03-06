import 'package:Day/Feature/Home/presentation/widgets/category_item.dart';
import 'package:Day/core/utils/constans.dart';
import 'package:Day/core/widgets/custom_circle_button.dart';
import 'package:Day/core/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

double xOffset = 0, xxOffset = 0;
double yOffset = 0, yyOffset = 0;
double scaleFactor = 1;

bool isDrawerOpen = false;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (isDrawerOpen == true) {
          setState(
            () {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            },
          );
        }
      },
      onHorizontalDragEnd: (dragEndDetails) {
        if (dragEndDetails.primaryVelocity < 0) {
          // Page forwards
          print('Move page forwards');
          setState(
            () {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
            },
          );
        } else if (dragEndDetails.primaryVelocity > 0) {
          // Page backwards
          print('Move page backwards');
          setState(
            () {
              xOffset = size.width * 0.85;
              yOffset = size.height * 0.1;
              scaleFactor = 0.8;
              isDrawerOpen = true;
            },
          );
        }
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor)
          ..rotateY(isDrawerOpen ? -0.5 : 0),
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: blue,
            borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
            boxShadow: isDrawerOpen
                ? [
                    BoxShadow(
                      color: white.withOpacity(0.5),
                      spreadRadius: -15,
                      blurRadius: 25,
                      offset: Offset(-size.width * 0.03, 0),
                    )
                  ]
                : null),
        child: Scaffold(
          floatingActionButton: CustomCircleButton(
            size: size,
            width: size.width * 0.15,
            height: size.height * 0.08,
            icon: Icons.add,
            color: pink,
            onPress: () {
              Navigator.pushNamed(context, '/AddTask');
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    isDrawerOpen
                        ? IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: size.width * 0.08,
                              color: skyBlue,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                },
                              );
                            },
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.menu,
                              size: size.width * 0.08,
                              color: skyBlue,
                            ),
                            onPressed: () {
                              setState(
                                () {
                                  xOffset = size.width * 0.85;
                                  yOffset = size.height * 0.1;
                                  scaleFactor = 0.8;
                                  isDrawerOpen = true;
                                },
                              );
                            },
                          ),
                    Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              size: size.width * 0.08,
                              color: skyBlue,
                            ),
                            onPressed: null),
                        IconButton(
                            icon: Icon(
                              Icons.notifications_none,
                              size: size.width * 0.08,
                              color: skyBlue,
                            ),
                            onPressed: null),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    translate("Home.Home.Wellcome") + "Olivia!",
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: size.width * 0.08,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    translate("Home.Home.Category"),
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: CategoryItem(
                          size: size,
                          task: "25 ",
                          category: "Business",
                          color: pink,
                          width: 20,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                  child: Text(
                    "Today's Task",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.85,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                          horizontal: size.width * 0.05,
                        ),
                        child: Item(size: size),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  const Item({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ItemState createState() => _ItemState();
}

bool isOpen = false;

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: (dragEndDetails) {
        if (dragEndDetails.primaryVelocity < 0) {
          // Page forwards
          print('Move page forwards');
          setState(
            () {
              xxOffset = 0;
              isOpen = false;
            },
          );
        } else if (dragEndDetails.primaryVelocity > 5) {
          // Page backwards
          print('Move page backwards');
          setState(
            () {
              xxOffset = 150;
              isOpen = true;
            },
          );
        }
      },
      child: AnimatedContainer(
        transform: Matrix4.translationValues(xxOffset, yyOffset, 0)
          ..scale(scaleFactor),
        duration: Duration(milliseconds: 250),
        child: Row(
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: isOpen == true
                  ? Row(
                      children: [
                        CustomCircleButton(
                          size: size,
                          width: size.width * 0.12,
                          height: size.height * 0.06,
                          icon: Icons.delete,
                          color: red,
                          onPress: () {
                            Navigator.pushNamed(context, '/AddTask');
                          },
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        CustomCircleButton(
                          size: size,
                          width: size.width * 0.12,
                          height: size.height * 0.06,
                          icon: Icons.check,
                          color: Colors.green,
                          onPress: () {
                            Navigator.pushNamed(context, '/AddTask');
                          },
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                      ],
                    )
                  : Text(''),
            ),
            Flexible(
              child: TaskItem(
                size: widget.size,
                task: "25 ",
                category: "Business",
                color: pink,
                width: size.width * 0.9,
                isComplete: false,
                onPress: () {
                  Navigator.pushNamed(context, "/EditTask");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
