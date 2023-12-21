import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/controllers/home_provider.dart';
import 'package:movie_app/service/apiservice.dart';
import 'package:movie_app/views/widgets/carousel_slider.dart';
import 'package:movie_app/views/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    final moviecontroller = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Trending",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(
              child: FutureBuilder(
                  future: moviecontroller.getMoviestoHome(url: trending),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MyCarouselSlider(
                        snapshot: snapshot,
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: Image.asset(
                            'assets/cartoon-cloud-without-network-hint-baa876c7ada8297394d6e5ae875d9fc0.png'),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Popular Movies ",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            FutureBuilder(
                future: moviecontroller.getMoviestoHome(url: popular),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MovieList(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Up Coming Movie ",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            FutureBuilder(
                future: moviecontroller.getMoviestoHome(url: upcomingMovies),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MovieList(
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(child: Text(''));
                  }
                })
          ],
        ),
      )),
    );
  }
}
