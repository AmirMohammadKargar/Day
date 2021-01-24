import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key key,
    @required this.size,
    this.text,
    this.icon,
  }) : super(key: key);

  final Size size;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: darkBlue,
              blurRadius: 20.0,
              spreadRadius: -5,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: TextField(
          style: Theme.of(context).textTheme.button.copyWith(color: skyBlue),
          decoration: InputDecoration(
            hintText: "$text",
            hintStyle:
                Theme.of(context).textTheme.button.copyWith(color: skyBlue),
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: skyBlue,
              size: size.width * 0.06,
            ),
          ),
        ),
      ),
    );
  }
}
