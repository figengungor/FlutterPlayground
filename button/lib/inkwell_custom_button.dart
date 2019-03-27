import 'package:flutter/material.dart';

//https://stackoverflow.com/a/52303225/1463542
//https://stackoverflow.com/a/52697978/1463542
//https://docs.flutter.io/flutter/material/InkWell-class.html

class InkWellCustomButton extends StatelessWidget {
  final _borderRadius = BorderRadius.circular(25.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Container(InkWell), no color, yes animation'),
        ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Container(InkWell), yes color, no animation=('),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: _borderRadius,
              color: Colors.lightGreen),
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: Colors.red,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Ink(InkWell), yes color, yes animation=)'),
        ),
        //Ink, which paints a Decoration on a Material,
        //allowing InkResponse and InkWell splashes to paint over them.
        Ink(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: _borderRadius,
              color: Colors.lightGreen),
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: Colors.red,
            splashColor: Colors.green.shade200,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Material(InkWell), yes color, yes animation=)'),
        ),
        Material(
          color:Colors.lightGreen,
          shape: RoundedRectangleBorder(borderRadius: _borderRadius, side: BorderSide(color: Colors.black)),
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: Colors.green.shade300,
            splashColor: Colors.green,
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
