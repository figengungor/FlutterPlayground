import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pageview/circle_page_indicator.dart';
import 'package:pageview/circle_page_indicator2.dart';

class PageViewLoop extends StatefulWidget {
  @override
  _PageViewLoopState createState() => _PageViewLoopState();
}

class _PageViewLoopState extends State<PageViewLoop>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  Future<List<dynamic>> _fetchPicsumListFuture;

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final int maxPageCount = 4;

  ValueNotifier<int> _currentPageNotifier = ValueNotifier(0);

  @override
  void initState() {
    _fetchPicsumListFuture = _fetchPicsumList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Loop')),
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
    final int pageCount = getPageCount(data);
    return SizedBox(
      height: screenSize.width * aspectRatio,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          final imageId = data[index % pageCount]['id'];

          return Image.network(
            "https://picsum.photos/${screenSize.width}/${screenSize.width * aspectRatio}?image=$imageId",
            width: screenSize.width,
          );
        },
        onPageChanged: (int pageIndex) {
          _currentPageNotifier.value = pageIndex % pageCount;
        },
      ),
    );
  }

  Widget _buildIndicator(int itemCount) {
    return CirclePageIndicator2(
        currentPageNotifier: _currentPageNotifier,
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
