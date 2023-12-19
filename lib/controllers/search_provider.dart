import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/service/apiservice.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController queryController = TextEditingController();
  final ApiService service = ApiService();
  List<MovieModel> searchResults = [];
  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "https://api.themoviedb.org/3/search/movie?query=$query&api_key=62993259b09bd60f498f3221ef24fe9c";
        List<MovieModel> movies =
            await service.searchMovie(searchurl: searchUrl);

        searchResults = movies;
        notifyListeners();
      } catch (e) {
        print("Error: $e");
      }
    } else {
      searchResults = [];
      notifyListeners();
    }
  }
}
