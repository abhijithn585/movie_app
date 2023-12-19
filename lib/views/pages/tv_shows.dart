import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/service/apiservice.dart';
import 'package:movie_app/views/widgets/card_heading.dart';
import 'package:movie_app/views/widgets/grid_widget.dart';

class TvShowsScreen extends StatefulWidget {
  const TvShowsScreen({super.key});

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeadings(
            heading: "Top Rated",
            left: 20,
            top: 20,
            fontsize: 18,
          ),
          Expanded(
            child: FutureBuilder(
                future: service.getMovies(url: topRatedTvShow),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return GridWidget(snapshot: snapshot);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          CardHeadings(
            heading: "Trending Shows",
            left: 20,
            top: 20,
            fontsize: 18,
          ),
          Expanded(
            child: FutureBuilder(
                future: service.getMovies(url: popularTvShow),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return GridWidget(snapshot: snapshot);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
