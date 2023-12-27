import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/cast_modal.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/service/apiservice.dart';

class DetailsPage extends StatelessWidget {
  MovieModel movies;
  int? id;
  DetailsPage({super.key, required this.movies, this.id});
  @override
  Widget build(BuildContext context) {
    ApiService service = ApiService();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '${movies.original_title}',
                style: const TextStyle(fontSize: 10),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Image.network("$imagePath${movies.poster_path}",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Rating",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        RatingBarIndicator(
                            itemSize: 20,
                            rating: movies.vote_average! / 2,
                            itemCount: 5,
                            unratedColor: Colors.grey,
                            itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.red,
                                )),
                        Text(
                          "${(movies.vote_average! / 2).toStringAsFixed(1)}",
                          style: const TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      "Lang:${movies.original_language}",
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Over View",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${movies.overview}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Cast",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                  FutureBuilder(
                    future: service.getcasts(
                      casturl:
                          'https://api.themoviedb.org/3/movie/$id/credits?api_key=cf486b5d031ee63d98fe797f34892bee',
                    ),
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        print(snapshot.error);
                        return Text(snapshot.error.toString());
                      } else {
                        return SizedBox(
                          height: 130,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: data!.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              CastModel casts = data[index];
                              return Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Container(
                                        color: Colors.black,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            radius: 45,
                                            foregroundImage: NetworkImage(
                                                '$imagePath${casts.profile_path!}'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      casts.name!,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
