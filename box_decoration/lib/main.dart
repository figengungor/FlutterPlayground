import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const String url =
    "https://images.unsplash.com/photo-1525193792470-66955780542b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=33c7e37e76c1349c9b0bf5068f847721&auto=format&fit=crop&w=1091&q=80";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BoxDecoration Playground',
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
        title: Text('BoxDecoration Playground'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "Color",
                style: TextStyle(background: Paint()..color = Colors.white),
              ),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
            ),
            child: Center(
                child: Text("Color&Image",
                    style:
                        TextStyle(background: Paint()..color = Colors.white))),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.transparent.withOpacity(0.5), BlendMode.dstATop)),
            ),
            child: Center(
                child: Text("Image&Opacity",
                    style:
                        TextStyle(background: Paint()..color = Colors.white))),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.transparent.withOpacity(0.5), BlendMode.dstATop)),
            ),
            child: Center(
                child: Text("Image&Opacity&Color",
                    style:
                        TextStyle(background: Paint()..color = Colors.white))),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber, width: 10.0),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
            ),
            child: Center(
              child: Text(
                "Border&BorderRadius&Image",
                style: TextStyle(background: Paint()..color = Colors.white),
              ),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                "BoxShadow with blurRadius:8.0",
                style: TextStyle(background: Paint()..color = Colors.white),
              ),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 4.0,
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                "BoxShadow with spreadRadius:4.0, blurRadius:4.0",
                style: TextStyle(background: Paint()..color = Colors.white),
              ),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(8.0, 8.0),
                    blurRadius: 4.0),
              ],
            ),
            child: Center(
              child: Text(
                "BoxShadow with Offset(8.0, 8.0)",
                style: TextStyle(background: Paint()..color = Colors.white),
              ),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0,
                    offset: Offset(0.0, 20.0)),
              ],
            ),
            child: Center(
              child: Text(
                "BoxShadow with Offset(0.0, 20.0) with blurRadius:20.0",
                style: TextStyle(background: Paint()..color = Colors.white),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover),
              ),
              child: Center(
                child: Text(
                  "Shape:\n BoxShape.circle",
                  textAlign: TextAlign.center,
                  style: TextStyle(background: Paint()..color = Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, Colors.amber],
            )),
            child: Center(
              child: Text(
                "Gradient",
                style: TextStyle(background: Paint()..color = Colors.white),
              ),
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.amber],
              ),
            ),
            child: Center(
                child: Text("Gradient",
                    style:
                        TextStyle(background: Paint()..color = Colors.white))),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.amber, Colors.pink],
                  stops: [0.0, 0.5, 1.0]),
            ),
            child: Center(
                child: Text("Gradient",
                    style:
                        TextStyle(background: Paint()..color = Colors.white))),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.amber.withOpacity(0.7)),
            position: DecorationPosition.background,
            child: Text("DecoratedBox position background"),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.amber.withOpacity(0.7)),
            position: DecorationPosition.foreground,
            child: Text("DecoratedBox position foreground"),
          )
        ]
            .map((item) => Padding(
                  child: item,
                  padding: EdgeInsets.all(16.0),
                ))
            .toList(),
      ),
    );
  }
}
