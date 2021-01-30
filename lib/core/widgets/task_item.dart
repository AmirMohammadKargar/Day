import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key key,
    @required this.size,
    this.color,
    this.task,
    this.category,
    this.width,
    this.onPress,
    this.isComplete,
  }) : super(key: key);

  final Size size;
  final Color color;
  final String task, category;
  final double width;
  final Function onPress;
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: size.height * 0.1,
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
            child: Row(
              children: <Widget>[
                isComplete == true
                    ? Container(
                        width: size.width * 0.1,
                        height: size.height * 0.04,
                        decoration: BoxDecoration(
                          color: darkBlue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: white,
                        ),
                      )
                    : Container(
                        width: size.width * 0.1,
                        height: size.height * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: color,
                            width: size.width * 0.005,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                SizedBox(width: size.width * 0.02),
                Text(
                  "$task" + "tasks",
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
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
