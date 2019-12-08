import 'package:flutter/material.dart';
import 'package:movie_details_page/movie_api.dart';
import 'package:movie_details_page/movie_details_screen.dart';

void main() => runApp(DetailsApp());

class DetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: const Color(0xFFFF5959),
      ),
      home: MovieDetailsScreen(testMovie),
    );
  }
}
