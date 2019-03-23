import 'package:flutter/material.dart';

class PhotoHorizontalCard extends StatelessWidget {
  final double cardHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        margin: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/images/card_image.jpg',
                width: cardHeight,
                height: cardHeight,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Beautiful Sunset'),
                    Text(
                      'by Unsplash',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
