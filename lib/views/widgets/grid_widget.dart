import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/views/pages/details_page.dart';

class GridWidget extends StatelessWidget {
  GridWidget({super.key, required this.snapshot});
  AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          MovieModel movieData = snapshot.data[index];
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GestureDetector(
                        child: Container(
                          width: 200,
                          color: Colors.amber,
                          child: Image.network(
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              "${imagePath}${snapshot.data[index].poster_path}"),
                        ),
                        // onTap: (){
                        //   DetailsPage(movies: movieData,)
                        // },
                      ),
                    ),
                  ),
                ),
                Text("${snapshot.data![index].name}",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          );
        });
  }
}