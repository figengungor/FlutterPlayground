import 'dart:async';
import 'package:flutter/material.dart';

//https://marcinszalek.pl/flutter/infinite-dynamic-listview/

class PageViewInfinite extends StatefulWidget {
  @override
  _PageViewInfiniteState createState() => _PageViewInfiniteState();
}

class _PageViewInfiniteState extends State<PageViewInfinite> {
  static int itemsPerPage = 5;
  List<int> _items = List.generate(itemsPerPage, (i) => i);
  PageController _controller = PageController();
  bool _isNextPageLoading = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.extentAfter < 500) {
        loadMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Infinite')),
      body: _buildPageView(),
    );
  }

  Future<List<int>> _fetchList(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _controller,
      itemCount: _items.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == _items.length) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(
            child: Text(
          index.toString(),
          style: TextStyle(fontSize: 90.0),
        ));
      },
    );
  }

  void loadMore() async {
    if (!_isNextPageLoading) {
      _isNextPageLoading = true;
      var list = await _fetchList(_items.length, _items.length + itemsPerPage);
      setState(() {
        _items.addAll(list);
      });
      _isNextPageLoading = false;
    }
  }
}
