import 'package:flutter/material.dart';
import 'package:netflix_app/screens/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key? key, this.scrollOffset = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: Responsive(
          mobile: CustomAppBarMobile(),
          desktop: CustomAppBarDesktop(),
        ));
  }
}
