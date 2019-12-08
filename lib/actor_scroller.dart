import 'package:flutter/material.dart';
import 'package:movie_details_page/models.dart';

class ActorScroller extends StatelessWidget {
  ActorScroller(this.actors);
  final List<Actor> actors;

  Widget _buildActor(BuildContext context, int position) {
    final actor = actors[position];

    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(actor.avatarUrl),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(actor.name),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Actors',
            style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: Size.fromHeight(120.0),
          child: ListView.builder(
            itemCount: actors.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 12.0, left: 20.0),
            itemBuilder: _buildActor,
          ),
        ),
      ],
    );
  }
}
