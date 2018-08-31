import 'package:flutter/material.dart';

class PageViewSimpleArrows extends StatefulWidget {
  @override
  _PageViewSimpleArrowsState createState() => _PageViewSimpleArrowsState();
}

class _PageViewSimpleArrowsState extends State<PageViewSimpleArrows>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  final _pages = [
    FlutterLogo(colors: Colors.red),
    FlutterLogo(colors: Colors.green),
    FlutterLogo(colors: Colors.blue),
  ];

  int _pageIndex = 0;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Simple Arrows')),
      body: _buildBody(),
    );
  }

  //Using default constructor

  /*
  This constructor is appropriate for page views with a small number of
  children because constructing the List requires doing work for every child
  that could possibly be displayed in the page view, instead of just those
  children that are actually visible.
  */

  _buildBody() {
    return Row(
      children: <Widget>[
        Opacity(
          opacity: isFirstPage() ? 0.0 : 1.0,
          child: IconButton(
            iconSize: 46.0,
            icon: Icon(
              Icons.chevron_left,
            ),
            onPressed: isFirstPage()
                ? null
                : () {
                    /* _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);*/
                    _pageController.jumpToPage(_pageIndex - 1);
                  },
          ),
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: PageView(
              controller: _pageController,
              onPageChanged: (int pageIndex) {
                setState(() {
                  _pageIndex = pageIndex;
                });
              },
              children: _pages
                  .map((logo) => GestureDetector(
                        onTap: () {
                          _animationController.reset();
                          _animationController.forward();
                        },
                        child: RotationTransition(
                          turns: _animationController,
                          child: logo,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        Opacity(
          opacity: isLastPage() ? 0.0 : 1.0,
          child: IconButton(
            iconSize: 46.0,
            icon: Icon(Icons.chevron_right),
            onPressed: isLastPage()
                ? null
                : () {
                    /* _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);*/
                    _pageController.jumpToPage(_pageIndex + 1);
                  },
          ),
        ),
      ],
    );
  }

  bool isFirstPage() => _pageIndex == 0;

  bool isLastPage() => _pageIndex == _pages.length - 1;
}

//https://stackoverflow.com/questions/51119795/how-to-remove-scroll-glow

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
