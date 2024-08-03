import 'package:flutter/material.dart';
import 'package:netflix_app/helpers/assets.dart';
import 'package:netflix_app/screens/widgets/widgets.dart';

class CustomAppBarMobile extends StatelessWidget {
  const CustomAppBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset("${Assets.netflixLogo0}"),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(
                  onTap: () {},
                  title: "TV Shows",
                ),
                AppBarButton(
                  onTap: () {},
                  title: "Movies",
                ),
                AppBarButton(
                  onTap: () {},
                  title: "MY List",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
