import 'package:bottom_bar/bottom_bar.dart';
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
        bottomNavigationBar: BottomBar(
          selectedIndex: bottomProvider.selectedIndex,
          backgroundColor: Colors.black,
          onTap: bottomProvider.navigateBottomBar,
          items: const <BottomBarItem>[
            BottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                activeTitleColor: Colors.red,
                activeColor: Colors.grey,
                inactiveColor: Colors.grey),
            BottomBarItem(
                icon: Icon(Icons.search),
                title: Text("Search"),
                activeTitleColor: Colors.red,
                activeColor: Colors.grey,
                inactiveColor: Colors.grey),
            BottomBarItem(
                icon: Icon(Icons.live_tv),
                title: Text("Tv Show"),
                activeColor: Colors.grey,
                activeTitleColor: Colors.red,
                inactiveColor: Colors.grey),
            BottomBarItem(
                icon: Icon(Icons.movie_filter_sharp),
                title: Text("Movies"),
                activeTitleColor: Colors.red,
                activeColor: Colors.grey,
                inactiveColor: Colors.grey),
          ],
        ),
      ),
    );
  }
}
