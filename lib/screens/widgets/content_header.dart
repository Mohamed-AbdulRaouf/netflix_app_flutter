import 'package:flutter/material.dart';
import 'package:netflix_app/models/models.dart';
import 'package:netflix_app/screens/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({super.key, required this.featuredContent});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: ContentHeaderMobile(featuredContent: featuredContent),
        desktop: ContentHeaderDesktop(featuredContent: featuredContent));
  }
}
