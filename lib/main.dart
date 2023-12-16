import 'package:flutter/material.dart';
import 'package:movie_app/controllers/bottom_nav_bar.dart';
import 'package:movie_app/views/search_creen.dart';
import 'package:movie_app/views/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider())
      ],
      child: MaterialApp(
        home: BottomNavBar(),
      ),
    );
  }
}
