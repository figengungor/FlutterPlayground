import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:pageview/circle_page_indicator.dart';

//https://gist.github.com/collinjackson/4fddbfa2830ea3ac033e34622f278824

class PageViewIndicatorDemo extends StatefulWidget {
  @override
  _PageViewIndicatorDemoState createState() => _PageViewIndicatorDemoState();
}

class _PageViewIndicatorDemoState extends State<PageViewIndicatorDemo>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  Future<List<dynamic>> _fetchPicsumListFuture;

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final int maxPageCount = 8;

  int _currentPageIndex = 0;

  @override
  void initState() {
    _fetchPicsumListFuture = _fetchPicsumList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Builder')),
      body: _buildBody(),
    );
  }

  //Using builder constructor

  /*
 This constructor is appropriate for page views with a large (or infinite)
 number of children because the builder is called only for those children that
 are actually visible.
  */

  _buildBody() {
    return FutureBuilder<List<dynamic>>(
        future: _fetchPicsumListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return _buildPageViewWithIndicator(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: Text('Loading...'));
          }
        });
  }

  Future<List<dynamic>> _fetchPicsumList() async {
    try {
      final response = await http.get("https://picsum.photos/list");
      print(response.body);
      final list = json.decode(response.body);
      return list;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Widget _buildPageView(List data) {
    final screenSize = MediaQuery.of(context).size;
    final aspectRatio = 2 / 3;
    return SizedBox(
      height: screenSize.width * aspectRatio,
      child: PageView.builder(
        controller: _pageController,
        itemCount: getPageCount(data),
        itemBuilder: (BuildContext context, int index) {
          final imageId = data[index]['id'];

          return Image.network(
            "https://picsum.photos/${screenSize.width}/${screenSize.width * aspectRatio}?image=$imageId",
            width: screenSize.width,
          );
        },
        onPageChanged: (int pageIndex) {
          setState(() {
            _currentPageIndex = pageIndex;
          });
        },
      ),
    );
  }

  Widget _buildIndicator(int itemCount) {
    return CirclePageIndicator(
        radius: 4.0,
        currentPageIndex: _currentPageIndex,
        itemCount: itemCount,
        dotColor: Colors.white.withOpacity(0.6),
        selectedDotColor: Colors.white,
        onPageSelected: (int page) {
          _pageController.animateToPage(
            page,
            duration: _kDuration,
            curve: _kCurve,
          );
        });
  }

  Widget _buildPageViewWithIndicator(List data) {
    return Container(
      color: Colors.grey,
      child: Stack(
        children: <Widget>[
          _buildPageView(data),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.black.withOpacity(0.6),
                  child: _buildIndicator(getPageCount(data)))),
        ],
      ),
    );
  }

  int getPageCount(List data) =>
      data.length > maxPageCount ? maxPageCount : data.length;
}
