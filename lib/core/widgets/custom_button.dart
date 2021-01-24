import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.size,
    this.text,
    this.onPress,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.075,
      decoration: BoxDecoration(
        color: deepBlue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: deepBlue.withOpacity(0.7),
            spreadRadius: -5,
            blurRadius: 35,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            onPress();
          },
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.button.copyWith(
                    fontSize: size.width * 0.05,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
