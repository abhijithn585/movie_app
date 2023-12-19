import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/views/pages/details_page.dart';

class ListItem extends StatelessWidget {
  ListItem({super.key, required this.snapshot});
  AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(movies: snapshot.data[index])));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.amber,
                      child: Image.network(
                          "${imagePath}${snapshot.data[index].poster_path}",
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${snapshot.data[index].original_title}",
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                      style: TextStyle(color: Colors.amber),
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                            itemSize: 20,
                            rating: snapshot.data[index].vote_average / 2,
                            itemCount: 5,
                            itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                )),
                        Text(
                          "${(snapshot.data[index].vote_average / 2).toStringAsFixed(1)}",
                          style: TextStyle(color: Colors.amber),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
