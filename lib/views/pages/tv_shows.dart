import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/controllers/home_provider.dart';
import 'package:movie_app/views/widgets/card_heading.dart';
import 'package:movie_app/views/widgets/grid_widget.dart';
import 'package:provider/provider.dart';

class TvShowsScreen extends StatefulWidget {
  const TvShowsScreen({super.key});

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  @override
  Widget build(BuildContext context) {
    final movieController = Provider.of<HomeProvider>(context);

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
                future: movieController.getMoviestoHome(url: topRatedTvShow),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return GridWidget(snapshot: snapshot);
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: Image.asset(
                          "assets/cartoon-cloud-without-network-hint-baa876c7ada8297394d6e5ae875d9fc0.png"),
                    );
                  } else {
                    return Center(child: Text(""));
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
                future: movieController.getMoviestoHome(url: popularTvShow),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return GridWidget(snapshot: snapshot);
                  } else {
                    return Center(child: Text(""));
                  }
                }),
          ),
        ],
      ),
    );
  }
}
