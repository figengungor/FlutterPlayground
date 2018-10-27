import 'package:flutter/material.dart';
import 'package:slivers/sliver_app_bar_flexible_space_demo.dart';
import 'package:slivers/sliver_app_bar_flexible_space_title_demo.dart';
import 'package:slivers/sliver_app_bar_floating_demo.dart';
import 'package:slivers/sliver_app_bar_pinned_demo.dart';
import 'package:slivers/sliver_app_bar_snap_demo.dart';
import 'package:slivers/sliver_fill_remaining_demo.dart';
import 'package:slivers/sliver_fixed_extent_list_demo.dart';
import 'package:slivers/sliver_grid_demo.dart';
import 'package:slivers/sliver_grid_extent_demo.dart';
import 'package:slivers/sliver_list_sliver_child_builder_delegate.dart';
import 'package:slivers/sliver_list_sliver_child_list_delegate.dart';
import 'package:slivers/sliver_persistent_header_demo.dart';
import 'package:slivers/sliver_prototype_extent_list_demo.dart';
import 'package:slivers/sliver_to_box_adapter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slivers Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/sliver_app_bar_pinned_demo': (context) => SliverAppBarPinnedDemo(),
        '/sliver_app_bar_floating_demo': (context) =>
            SliverAppBarFloatingDemo(),
        '/sliver_app_bar_snap_demo': (context) => SliverAppBarSnapDemo(),
        '/sliver_app_bar_flexible_space_demo': (context) =>
            SliverAppBarFlexibleSpaceDemo(),
        '/sliver_app_bar_flexible_space_title_demo': (context) =>
            SliverAppBarFlexibleSpaceTitleDemo(),
        '/sliver_fill_remaining_demo': (context) => SliverFillRemainingDemo(),
        '/sliver_list_sliver_child_list_delegate': (context) =>
            SliverListSliverChildListDelegate(),
        '/sliver_list_sliver_child_builder_delegate': (context) =>
            SliverListSliverChildBuilderDelegate(),
        '/sliver_fixed_extent_list_demo': (context) =>
            SliverFixedExtentListDemo(),
        '/sliver_grid_demo': (context) => SliverGridDemo(),
        '/sliver_grid_extent_demo': (context) => SliverGridExtentDemo(),
        '/sliver_persistent_header_demo': (context) =>
            SliverPersistentHeaderDemo(),
        '/sliver_to_box_adapter_demo': (context) => SliverToBoxAdapterDemo(),
        '/sliver_prototype_extent_list_demo': (context) =>
            SliverPrototypeExtentListDemo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _navItems = [
    NavItem('SliverAppBar(pinned:true)', '/sliver_app_bar_pinned_demo'),
    NavItem('SliverAppBar(floating:true)', '/sliver_app_bar_floating_demo'),
    NavItem('SliverAppBar(snap:true)', '/sliver_app_bar_snap_demo'),
    NavItem(
        'SliverAppBar(flexibleSpace)', '/sliver_app_bar_flexible_space_demo'),
    NavItem('SliverAppBar(flexibleSpace:title)*',
        '/sliver_app_bar_flexible_space_title_demo'),
    NavItem('SliverFillRemaining(BUGGY)', '/sliver_fill_remaining_demo'),
    NavItem('SliverList(SliverChildListDelegate)',
        '/sliver_list_sliver_child_list_delegate'),
    NavItem('SliverList(SliverChildBuilderDelegate)',
        '/sliver_list_sliver_child_builder_delegate'),
    NavItem('SliverFixedExtentList', '/sliver_fixed_extent_list_demo'),
    NavItem('SliverPrototypeExtentList', '/sliver_prototype_extent_list_demo'),
    NavItem('SliverGrid', '/sliver_grid_demo'),
    NavItem('SliverGridExtent', '/sliver_grid_extent_demo'),
    NavItem('SliverPersistentHeader', '/sliver_persistent_header_demo'),
    NavItem('SliverToBoxAdapter', '/sliver_to_box_adapter_demo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slivers Playground'),
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
