import 'package:flutter/material.dart';
import 'package:movie_details_page/actor_scroller.dart';
import 'package:movie_details_page/models.dart';
import 'package:movie_details_page/movie_details_header.dart';
import 'package:movie_details_page/photo_scroller.dart';
import 'package:movie_details_page/story_line.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MovieDetailHeader(movie),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Storyline(movie.storyline),
            ),
            PhotoScroller(movie.photoUrls),
            SizedBox(height: 20.0),
            ActorScroller(movie.actors),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
