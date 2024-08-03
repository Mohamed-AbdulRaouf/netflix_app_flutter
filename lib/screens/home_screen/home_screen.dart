import 'package:flutter/material.dart';
import 'package:netflix_app/cubits/app_bar_cubit.dart';
import 'package:netflix_app/data/data.dart';
import '../widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
        context.read<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child:
            BlocBuilder<AppBarCubit, double>(builder: (context, scrollOffset) {
          return CustomAppBar(
            scrollOffset: scrollOffset,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade800,
        child: Icon(
          Icons.cast,
          size: 30.0,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(
              key: PageStorageKey("ContentHeader"),
              featuredContent: sintelContent,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey("previewsSCreen"),
                title: "Previews",
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                key: PageStorageKey("ContentList"),
                title: "My List",
                contentList: myList),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                key: PageStorageKey("NetflixOriginals"),
                title: "Netflix Originals",
                contentList: originals,
                isOriginals: true),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey("Trending"),
                  title: "Trending",
                  contentList: trending),
            ),
          ),
        ],
      ),
    );
  }
}
