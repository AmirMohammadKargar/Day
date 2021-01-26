import 'package:Day/core/utils/constans.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
