import 'package:flutter/material.dart';
import 'package:netflix_app/cubits/app_bar_cubit.dart';
import 'package:netflix_app/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey("homeScreen")),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  final Map<String, IconData> _icons = {
    "Home": Icons.home,
    "Search": Icons.search,
    "Coming Soon": Icons.queue_play_next,
    "Downloads": Icons.file_download,
    "More": Icons.menu,
  };

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
          create: (_) => AppBarCubit(), child: _screens[_index]),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: _icons
                  .map((title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                          icon: Icon(
                            icon,
                            size: 30.0,
                          ),
                          label: title)))
                  .values
                  .toList(),
              currentIndex: _index,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
              onTap: (index) {
                setState(() {
                  _index = index;
                });
              },
            )
          : null,
    );
  }
}
