import 'package:flutter/material.dart';
import 'package:movie_app/controllers/bottom_nav_bar.dart';
import 'package:movie_app/views/homescreen.dart';
import 'package:movie_app/views/movies_screen.dart';
import 'package:movie_app/views/search_creen.dart';
import 'package:movie_app/views/tv_shows.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final List<Widget> _pages = [
    const Homescreen(),
    const SearchScreen(),
    const TvShowsScreen(),
    const MovieScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider =
        Provider.of<BottomNavBarProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: _pages[bottomProvider.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          currentIndex: bottomProvider.selectedIndex,
          onTap: bottomProvider.navigateBottomBar,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.live_tv), label: "TV Shows"),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter_sharp), label: "Movies"),
          ],
        ),
      ),
    );
  }
}
