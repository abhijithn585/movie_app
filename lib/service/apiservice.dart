import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/cast_modal.dart';
import 'package:movie_app/models/movie_model.dart';

class ApiService {
  Dio dio = Dio();
  List<dynamic> exception = [];

  Future<List<MovieModel>> getMovies({required url}) async {
    try {
      final apiresponse = await dio.get(url);
      if (apiresponse.statusCode == 200) {
        final Map<String, dynamic> data = apiresponse.data;
        final List results = data["results"];
        return results.map((movie) => MovieModel.fromJson(movie)).toList();
      } else {
        print("status error:- ${apiresponse.statusCode}");
        return [];
      }
    } catch (a) {
      print("unable to fetch data:-${a}");
      return [];
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
        print('function error');
        return [];
      }
    } catch (e) {
      print("unable to fetch data:-${e}");
      return [];
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
          print('No "cast" key in response');
          return [];
        }
      } else {
        print('Error function - Status Code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
