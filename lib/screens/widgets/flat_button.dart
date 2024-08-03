import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double width;
  final double height;
  final IconData? iconData;
  final Color bgColor;
  final Color fgColor;
  final Color? iconColor;
  final Color? textColor;

  const FlatButton(
      {required this.text,
      this.onPressed,
      this.width = 100,
      this.height = 40,
      super.key,
      this.iconData,
      this.bgColor = Colors.transparent,
      this.fgColor = Colors.transparent,
      this.iconColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
        // padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        backgroundColor: bgColor,
        foregroundColor: fgColor);
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
          onPressed: onPressed,
          style: flatButtonStyle,
          //child: Text(text),
          child: iconData == null
              ? Text(
                  text,
                  style: TextStyle(color: textColor),
                )
              : Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    iconData,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.w600),
                  ),
                ])),
    );
  }
}
