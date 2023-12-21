import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controllers/bottom_nav_bar.dart';
import 'package:movie_app/views/pages/homescreen.dart';
import 'package:movie_app/views/pages/movies_screen.dart';
import 'package:movie_app/views/pages/search_creen.dart';
import 'package:movie_app/views/pages/tv_shows.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final List<Widget> _pages = [
    const Homescreen(),
    SearchScreen(),
    const TvShowsScreen(),
    MovieScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider =
        Provider.of<BottomNavBarProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Center(child: _pages[bottomProvider.selectedIndex]),
        extendBody: true,
        bottomNavigationBar: SizedBox(
          height: 125,
          child: DotNavigationBar(
            // selectedIconTheme: const
            // IconThemeData(color: Colors.black),
            // unselectedIconTheme: const IconThemeData(color: Colors.grey),
            currentIndex: bottomProvider.selectedIndex,
            onTap: bottomProvider.navigateBottomBar,
            enableFloatingNavBar: true,
            items: [
              DotNavigationBarItem(icon: Icon(Icons.home)),
              DotNavigationBarItem(icon: Icon(Icons.search)),
              DotNavigationBarItem(
                icon: Icon(Icons.live_tv),
              ),
              DotNavigationBarItem(icon: Icon(Icons.movie_filter_sharp)),
            ],
          ),
        ),
      ),
    );
  }
}
