import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controllers/home_provider.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:provider/provider.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider(
      {super.key, required this.height, required this.weidth});
  final double height;
  final double weidth;

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => SizedBox(
            width: double.infinity,
            child: CarouselSlider.builder(
              itemCount: homeProvider.movies?.length,
              itemBuilder: (context, itemIndex, pageViewIndex) {
                if (homeProvider.movies != null &&
                    homeProvider.movies!.isNotEmpty &&
                    itemIndex < homeProvider.movies!.length) {
                  MovieModel movie = homeProvider.movies![itemIndex];
                  return Container();
                }
                return Container();
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            )));
  }
}
