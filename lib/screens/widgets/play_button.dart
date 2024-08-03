import 'package:flutter/material.dart';
import 'package:netflix_app/screens/widgets/flat_button.dart';
import 'package:netflix_app/screens/widgets/responsive.dart';

class PlayButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onTap;

  const PlayButton(
      {Key? key,
      required this.onTap,
      this.icon = Icons.play_arrow,
      this.label = "Play"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !Responsive.isDesktop(context)
          ? EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0)
          : EdgeInsets.fromLTRB(25.0, 10.0, 30.0, 10.0),
      child: FlatButton(
        text: label,
        iconData: icon,
        textColor: Colors.black,
        iconColor: Colors.black,
        bgColor: Colors.white,
        onPressed: onTap,
      ),
    );
  }
}
