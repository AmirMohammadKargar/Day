import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    Key key,
    @required this.size,
    this.width,
    this.height,
    this.onPress,
  }) : super(key: key);

  final Size size;
  final double width, height;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pink,
        boxShadow: [
          BoxShadow(
            color: pink,
            spreadRadius: -5,
            blurRadius: 20,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onPress();
          },
          borderRadius: BorderRadius.circular(90),
          child: Icon(
            Icons.add,
            color: white,
          ),
        ),
      ),
    );
  }
}
