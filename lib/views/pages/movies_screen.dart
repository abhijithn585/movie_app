import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/service/apiservice.dart';
import 'package:movie_app/views/widgets/card_heading.dart';
import 'package:movie_app/views/widgets/list_movies.dart';

class MovieScreen extends StatefulWidget {
  MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    ApiService service = ApiService();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeadings(heading: "Trending", left: 20, top: 20),
          Expanded(
            child: FutureBuilder(
                future: service.getMovies(url: trending),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error.toString()}");
                  } else if (snapshot.hasData) {
                    return ListItem(snapshot: snapshot);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
