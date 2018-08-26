import 'package:flutter/material.dart';

class InfiniteList extends StatefulWidget {
  @override
  _InfiniteListState createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  ScrollController _scrollController;

  List<String> _items;

  @override
  void initState() {
    _items = [];
    _addItems();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      //When scroll position reaches to the end of scrollable content
      /*if (_scrollController.position.extentBefore ==
          _scrollController.position.maxScrollExtent) {*/

      /*
      ------------------------start of scrollable content 1

      extentInside => visible content between 1 - 2

      -------------------------end of scroll viewport 2

      extentBefore => distance between 1 - 3

      ------------------------ let's assume scroll position is here 3

      extentAfter => distance between 3 - 4

      -----------------------end of scrollable content 4
       */

      //To have a smooth loading try to load next Items
      //500.0 pixels above the scrollable content end
      if (_scrollController.position.extentAfter < 500.0) {
        setState(() {
          _addItems();
        });
      }
    });
    super.initState();
  }

  _addItems() {
    _items.addAll(List.generate(20, (int index) => 'Item $index'));
  }

  Widget _buildItem(int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          _items[index],
          style: TextStyle(fontSize: 46.0),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite Scroll')),
      body: ListView.builder(
          controller: _scrollController,
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(index);
          }),
    );
  }
}
