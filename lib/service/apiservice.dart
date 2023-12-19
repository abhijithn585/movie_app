import 'package:dio/dio.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/models/cast_modal.dart';
import 'package:movie_app/models/movie_model.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<MovieModel>> getMovies({required url}) async {
    // final String endpoint = "${trending}api_key=${apikey}";
    try {
      final apiresponse = await dio.get(url);
      if (apiresponse.statusCode == 200) {
        Map data = apiresponse.data;
        List results = data["results"];
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception("status error:- ${apiresponse.statusCode}");
      }
    } catch (a) {
      throw Exception("unable to fetch data:-${a}");
    }
  }

  Future<List<MovieModel>> searchMovie({required searchurl}) async {
    try {
      final response = await dio.get(searchurl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> searchdata = response.data;
        final List<dynamic> searchmovies = searchdata["results"];
        return searchmovies
            .map((search) => MovieModel.fromJson(search))
            .toList();
      } else {
        throw Exception('function error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CastModel>> getcasts({required casturl}) async {
    try {
      final response = await dio.get(casturl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data.containsKey("cast")) {
          final List<dynamic> results = data["cast"];
          return results.map((cast) => CastModel.fromJson(cast)).toList();
        } else {
          throw Exception('No "cast" key in response');
        }
      } else {
        throw Exception('Error function - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<MovieModel>> getSimilarMovies({required similarurl}) async {
    try {
      final response = await dio.get(similarurl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        final List<dynamic> similarmovie = data["results"];
        return similarmovie.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
