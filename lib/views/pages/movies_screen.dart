import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/controllers/home_provider.dart';
import 'package:movie_app/service/apiservice.dart';
import 'package:movie_app/views/widgets/card_heading.dart';
import 'package:movie_app/views/widgets/list_movies.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    final movieController = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeadings(heading: "Trending", left: 20, top: 20),
          Expanded(
            child: FutureBuilder(
                future: movieController.getMoviestoHome(url: trending),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error.toString()}");
                  } else if (snapshot.hasData) {
                    return ListItem(snapshot: snapshot);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: Image.asset(
                          "assets/cartoon-cloud-without-network-hint-baa876c7ada8297394d6e5ae875d9fc0.png"),
                    );
                  } else {
                    return Center(
                      child: Text(""),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
