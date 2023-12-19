import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/views/pages/details_page.dart';

class MovieList extends StatelessWidget {
  AsyncSnapshot snapshot;
  MovieList({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          itemCount: snapshot.data.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            MovieModel data = snapshot.data[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsPage(
                          id: snapshot.data[index].id,
                          movies: snapshot.data[index])));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.amber,
                      child: Image.network(
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          "${imagePath}${snapshot.data[index].poster_path}")),
                ),
              ),
            );
          }),
    );
  }
}
