import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/service/apiservice.dart';

class HomeProvider extends ChangeNotifier {
  final ApiService movieApiService = ApiService();
  List<MovieModel>? movies = [];
  Future<void> getMoviesToHome() async {
    try {
      List<MovieModel> movieResults =
          await movieApiService.getMovies(value: "$trending $apikey");
      movies = movieResults;
    } catch (error) {
      print("error fetching movie $error");
    }
    notifyListeners();
  }
}
