import 'package:dio/dio.dart';
import 'package:movie_app/constants/api_constants.dart';
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
}
