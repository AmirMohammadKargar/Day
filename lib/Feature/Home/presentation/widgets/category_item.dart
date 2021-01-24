import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key key,
    @required this.size,
    this.color,
    this.task,
    this.category,
    this.width,
    this.onPress,
  }) : super(key: key);

  final Size size;
  final Color color;
  final String task, category;
  final double width;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        color: deepBlue,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: deepBlue,
            spreadRadius: -10,
            blurRadius: 25,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            onPress();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "$task" + "tasks",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: size.width * 0.03,
                      ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  "$category",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  width: size.width * 0.38,
                  height: size.height * 0.005,
                  decoration: BoxDecoration(color: skyBlue),
                  child: FractionallySizedBox(
                    child: Divider(
                      endIndent: width == null ? null : width,
                      thickness: size.height * 0.005,
                      color: width == null ? Colors.transparent : pink,
                    ),
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
