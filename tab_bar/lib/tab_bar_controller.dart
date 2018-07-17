import 'package:flutter/material.dart';

//Credits

/*https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib
 /demo/material/tabs_fab_demo.dart*/

class TabBarController extends StatefulWidget {
  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  _Page _selectedPage;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _allPages.length, vsync: this);
    _controller.addListener(_handleTabSelection);
    _selectedPage = _allPages[0];
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTabSelection);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabController'),
        bottom: TabBar(
          controller: _controller,
          tabs: _allPages
              .map((page) => Tab(
                    text: page.label,
                    icon: Icon(page.icon),
                  ))
              .toList(),
        ),
        actions: _selectedPage.actions,
      ),
      body: TabBarView(
        controller: _controller,
        children: _allPages
            .map((page) => Container(
                color: page.colors.shade300,
                child: Icon(
                  page.icon,
                  size: 100.0,
                )))
            .toList(),
      ),
    );
  }

  void _handleTabSelection() {
    print('Tab ${_controller.index} is selected');
    setState(() {
      _selectedPage = _allPages[_controller.index];
    });
  }
}

//TabBarView model
class _Page {
  _Page({this.label, this.colors, this.icon, this.actions});

  final String label;
  final MaterialColor colors;
  final IconData icon;
  final List<Widget> actions;
}

final List<_Page> _allPages = [
  _Page(
    label: 'Popular',
    colors: Colors.pink,
    icon: Icons.favorite,
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  ),
  _Page(
    label: 'Top rated',
    colors: Colors.yellow,
    icon: Icons.star,
    actions: [
      IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {},
      ),
    ],
  ),
  _Page(
    label: 'Upcoming',
    colors: Colors.green,
    icon: Icons.access_time,
    actions: [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {},
      ),
    ],
  ),
];
