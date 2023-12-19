import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/service/apiservice.dart';
import 'package:movie_app/views/widgets/carousel_slider.dart';
import 'package:movie_app/views/widgets/movie_list.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    ApiService service = ApiService();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trending",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(
              child: FutureBuilder(
                  future: service.getMovies(url: trending),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MyCarouselSlider(
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Popular Movies ",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            FutureBuilder(
                future: service.getMovies(url: popular),
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
                    return Center(child: CircularProgressIndicator());
                  }
                }),
            Text("Up Coming Movie ",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            FutureBuilder(
                future: service.getMovies(url: upcomingMovies),
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
                    return Center(child: CircularProgressIndicator());
                  }
                }),
            // Text(" Popular TV Shows  ",
            //     style: TextStyle(color: Colors.white, fontSize: 20)),
            // MovieList(),
          ],
        ),
      )),
    );
  }
}



// Expanded(
//   child: SizedBox(
//     height: 500,
//     child: FutureBuilder(
//         future: service.getMovies(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   final moviedata = snapshot.data![index];
//                   return ListTile(
//                     title: Text(moviedata.title!),
//                   );
//                 });
//           } else {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           }
//         }),
//   ),
// )
