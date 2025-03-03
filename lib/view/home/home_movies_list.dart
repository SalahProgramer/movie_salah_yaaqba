import 'package:flutter/material.dart';
import 'package:movie_salah_yaaqba/widget/app_bar/custom_app_bar.dart';

class HomeMoviesList extends StatefulWidget {
  const HomeMoviesList({super.key});

  @override
  State<HomeMoviesList> createState() => _HomeMoviesListState();
}

class _HomeMoviesListState extends State<HomeMoviesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Movies list",
        textLeading: "",
        colorWidgets: Colors.white,
      ),
    );
  }
}
