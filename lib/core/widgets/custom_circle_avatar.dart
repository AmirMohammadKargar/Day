import 'package:Day/core/utils/constans.dart';
import 'package:Day/core/widgets/custom_circle_button.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.2,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 90,
            backgroundColor: skyBlue.withOpacity(0.5),
          ),
          Positioned(
            top: size.height * 0.14,
            right: size.width * 0.02,
            child: CustomCircleButton(
              size: size,
              width: size.width * 0.1,
              height: size.height * 0.05,
            ),
          )
        ],
      ),
    );
  }
}
