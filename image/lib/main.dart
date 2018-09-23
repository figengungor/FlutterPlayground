import 'package:flutter/material.dart';
import 'package:image/cached_network_image_placeholder.dart';
import 'package:image/fade_in_image_placeholder.dart';
import 'package:image/image_aspect_ratio.dart';
import 'package:image/image_asset_background.dart';
import 'package:image/image_asset_background2.dart';
import 'package:image/image_color_blend_mode.dart';
import 'package:image/image_network.dart';
import 'package:image/image_box_fit.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/image_asset_background': (context) => ImageAssetBackground(),
        '/image_asset_background2': (context) => ImageAssetBackground2(),
        '/image_network': (context) => ImageNetwork(),
        '/image_box_fit': (context) => ImageBoxFit(),
        '/image_aspect_ratio': (context) => ImageAspectRatio(),
        '/fade_in_image_placeholder': (context) => FadeInImagePlaceholder(),
        '/cached_network_image_placeholder': (context) =>
            CachedNetworkImagePlaceholder(),
        '/image_color_blend_mode': (context) => ImageColorBlendMode(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('Image Asset Background', '/image_asset_background'),
    NavItem('Image Asset Background 2', '/image_asset_background2'),
    NavItem('Image Network', '/image_network'),
    NavItem('Image BoxFit', '/image_box_fit'),
    NavItem('Image AspectRatio', '/image_aspect_ratio'),
    NavItem('FadeInImage Placeholder', '/fade_in_image_placeholder'),
    NavItem(
        'CachedNetworkImage Placeholder', '/cached_network_image_placeholder'),
    NavItem('Image colorBlendMode', '/image_color_blend_mode'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Playground'),
      ),
      body: _getNavButtons(context),
    );
  }

  _getNavButtons(BuildContext context) {
    return ListView(
      children: _navItems
          .map(
            (item) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pushNamed(context, item.routeName);
                    },
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
          )
          .toList(),
    );
  }
}

class NavItem {
  final title;
  final routeName;
  NavItem(this.title, this.routeName);
}
