import 'package:flutter/material.dart';

class InkWellCustomButton extends StatelessWidget {
  final _borderRadius = BorderRadius.circular(25.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: _borderRadius,
          ),
          child: InkWell(
            borderRadius: _borderRadius,
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Cancel'.toUpperCase(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
