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

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: CustomCircleButton(
        size: size,
        width: size.width * 0.15,
        height: size.height * 0.08,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: skyBlue,
              size: size.width * 0.08,
            ),
            onPressed: null),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: skyBlue,
                size: size.width * 0.08,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: skyBlue,
                size: size.width * 0.08,
              ),
              onPressed: null),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                    child: TaskItem(
                      size: size,
                      task: "25 ",
                      category: "Business",
                      color: pink,
                      width: 20,
                      isComplete: false,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
