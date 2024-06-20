import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final Function onPressed;
  final IconData? icon;
  final double? iconSize, size;
  final Color? backgroundColor, color;

  const CircleIcon(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.backgroundColor = Colors.black,
      this.color = Colors.white,
      this.iconSize = 30,
      this.size = 56})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: backgroundColor,
        child: InkWell(
          splashColor: Colors.grey, // Splash color
          onTap: () => onPressed(),
          child: Container(
              color: backgroundColor ?? Colors.black54.withOpacity(0.6),
              width: size,
              height: size,
              child: Icon(
                icon,
                size: iconSize,
                color: color,
              )),
        ),
      ),
    );
  }
}