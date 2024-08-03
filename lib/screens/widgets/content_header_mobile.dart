import 'package:flutter/material.dart';
import 'package:netflix_app/screens/widgets/widgets.dart';
import '../../models/models.dart';

class ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const ContentHeaderMobile({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl ?? ""),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        Positioned(
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl ?? ""),
          ),
        ),
        Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: "List",
                  onTap: () {},
                ),
                PlayButton(
                  onTap: () {},
                ),
                VerticalIconButton(
                  icon: Icons.info_outline,
                  title: "Info",
                  onTap: () {},
                )
              ],
            ))
      ],
    );
  }
}
