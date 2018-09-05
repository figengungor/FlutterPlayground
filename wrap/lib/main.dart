import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrap Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap Playground'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() => ListView(
        children: <Widget>[
          Text('Just children'),
          _buildWrap1(),
          Text('spacing: 8.0'),
          _buildWrap2(),
          Text('spacing: 8.0, runSpacing: 16.0'),
          _buildWrap3(),
          Text('alignment: WrapAlignment.center'),
          _buildWrap4(),
          Text('alignment: WrapAlignment.end'),
          _buildWrap5(),
          Text('alignment: WrapAlignment.spaceBetween'),
          _buildWrap6(),
          Text('alignment: WrapAlignment.spaceAround'),
          _buildWrap7(),
          Text('alignment: WrapAlignment.spaceEvenly'),
          _buildWrap8(),
          Text('verticalDirection: VerticalDirection.up'),
          _buildWrap9(),
          Text('crossAxisAlignment: WrapCrossAlignment.start(default)'),
          _buildWrap10(),
          Text('crossAxisAlignment: WrapCrossAlignment.center'),
          _buildWrap11(),
          Text('direction: Axis.vertical'),
          _buildWrap12(),
        ]
            .map((item) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: item,
                ))
            .toList(),
      );

  _buildWrap1() => Wrap(children: _generateCircles());

  _buildWrap2() => Wrap(spacing: 8.0, children: _generateCircles());

  _buildWrap3() =>
      Wrap(spacing: 8.0, runSpacing: 16.0, children: _generateCircles());

  _buildWrap4() => Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      runSpacing: 8.0,
      children: _generateCircles());

  _buildWrap5() => Wrap(
      alignment: WrapAlignment.end,
      spacing: 8.0,
      runSpacing: 8.0,
      children: _generateCircles());

  _buildWrap6() => Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 8.0,
      children: _generateCircles());

  _buildWrap7() => Wrap(
      alignment: WrapAlignment.spaceAround,
      runSpacing: 8.0,
      children: _generateCircles());

  _buildWrap8() => Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runSpacing: 8.0,
      children: _generateCircles());

  _buildWrap9() => Wrap(
      verticalDirection: VerticalDirection.up,
      spacing: 8.0,
      runSpacing: 8.0,
      children: _generateCircles());

  _buildWrap10() => Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: _generateCircles(isDifferentSize: true, circleSize: 10.0));

  _buildWrap11() => Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8.0,
      runSpacing: 8.0,
      children: _generateCircles(isDifferentSize: true, circleSize: 10.0));

  _buildWrap12() => Container(
      height: 200.0,
      child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          direction: Axis.vertical,
          children: _generateCircles()));

  _generateCircles(
          {int count = 10,
          double circleSize = 50.0,
          bool isDifferentSize = false}) =>
      List.generate(
        count,
        (index) => Material(
              type: MaterialType.circle,
              color: Colors.blue,
              child: Container(
                width: isDifferentSize ? circleSize + (index * 2) : circleSize,
                height: isDifferentSize ? circleSize + (index * 2) : circleSize,
                child: Center(child: Text(index.toString())),
              ),
            ),
      );
}
