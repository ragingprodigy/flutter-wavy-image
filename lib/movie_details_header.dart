import 'package:flutter/material.dart';
import 'package:movie_details_page/arc_banner_image.dart';
import 'package:movie_details_page/models.dart';
import 'package:movie_details_page/poster.dart';
import 'package:movie_details_page/rating_information.dart';

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailHeader(this.movie);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 140),
          child: ArcBannerImage(movie.bannerUrl),
        ),
        Positioned(
          bottom: 0,
          left: 16,
          right: 16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Poster(
                height: 180,
                posterUrl: movie.posterUrl,
              ),
              SizedBox(width: 16),
              Expanded(
                child: MovieInfo(movie),
              )
            ],
          ),
        )
      ],
    );
  }
}

class MovieInfo extends StatelessWidget {
  final Movie movie;

  const MovieInfo(this.movie);

  List<Widget> _buildCategoryChips(TextTheme textTheme) => movie.categories
      .map(
        (String category) => Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Chip(
            label: Text(category),
            labelStyle: textTheme.caption,
            backgroundColor: Colors.black12,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          movie.title,
          style: textTheme.title,
        ),
        SizedBox(height: 8),
        RatingInformation(movie),
        SizedBox(height: 12),
        Row(
          children: _buildCategoryChips(textTheme),
        )
      ],
    );
  }
}
