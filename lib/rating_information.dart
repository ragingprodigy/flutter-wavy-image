import 'package:flutter/material.dart';
import 'package:movie_details_page/models.dart';

class RatingInformation extends StatelessWidget {
  RatingInformation(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        NumericRating(movie.rating),
        SizedBox(width: 16.0),
        StarRating(movie.starRating),
      ],
    );
  }
}

class StarRating extends StatelessWidget {
  final int starRating;
  const StarRating(this.starRating);

  Widget _buildRatingBar(ThemeData theme) {
    var stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      var color = i <= starRating ? theme.accentColor : Colors.black12;
      var star = Icon(
        Icons.star,
        color: color,
      );

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var ratingCaptionStyle =
        theme.textTheme.caption.copyWith(color: Colors.black45);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRatingBar(theme),
        Padding(
          padding: EdgeInsets.only(top: 4.0, left: 4.0),
          child: Text(
            'Grade now',
            style: ratingCaptionStyle,
          ),
        ),
      ],
    );
  }
}

class NumericRating extends StatelessWidget {
  final double rating;

  const NumericRating(this.rating);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var ratingCaptionStyle = textTheme.caption.copyWith(color: Colors.black45);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          rating.toString(),
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          'Ratings',
          style: ratingCaptionStyle,
        ),
      ],
    );
  }
}
