import 'package:flutter/material.dart';

class PhotoScroller extends StatelessWidget {
  final List<String> photoUrls;

  const PhotoScroller(this.photoUrls);

  Widget _buildPhoto(BuildContext context, int index) {
    var photoUrl = photoUrls[index];

    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(
          photoUrl,
          width: 160,
          height: 120,
          fit: BoxFit.cover,
        ),
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
            'Photos',
            style: textTheme.subhead.copyWith(fontSize: 18.0),
          ),
        ),
        SizedBox.fromSize(
          size: Size.fromHeight(100.0),
          child: ListView.builder(
            itemCount: photoUrls.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 8.0, left: 20.0),
            itemBuilder: _buildPhoto,
          ),
        ),
      ],
    );
  }
}
