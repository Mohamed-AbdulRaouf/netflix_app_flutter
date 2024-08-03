import 'package:flutter/material.dart';
import 'package:netflix_app/helpers/assets.dart';
import 'package:netflix_app/screens/widgets/widgets.dart';

class CustomAppBarDesktop extends StatelessWidget {
  const CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset("${Assets.netflixLogo1}"),
          SizedBox(
            width: 12.0,
          ),
          // Spacer(),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarButton(
                  onTap: () {},
                  title: "Home",
                ),
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
                  title: "Latest",
                ),
                AppBarButton(
                  onTap: () {},
                  title: "My List",
                ),
                SizedBox(
                  width: 20.0,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                ),
                AppBarButton(
                  onTap: () {},
                  title: "KIDS",
                ),
                AppBarButton(
                  onTap: () {},
                  title: "DVD",
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.card_giftcard,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
