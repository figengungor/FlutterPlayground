import 'package:flutter/material.dart';

class CirclePageIndicator2 extends StatefulWidget {
  /// The current page index ValueNotifier
  final ValueNotifier<int> currentPageNotifier;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  ///The dot color
  final Color dotColor;

  ///The selected dot color
  final Color selectedDotColor;

  final double size;

  final double selectedSize;

  final double dotSpacing;

  CirclePageIndicator2({
    Key key,
    @required this.currentPageNotifier,
    @required this.itemCount,
    this.onPageSelected,
    this.size = 8.0,
    this.dotSpacing = 8.0,
    this.dotColor = Colors.black,
    this.selectedDotColor = Colors.blue,
    this.selectedSize = 12.0,
  }) : super(key: key);

  @override
  CirclePageIndicator2State createState() {
    return new CirclePageIndicator2State();
  }
}

class CirclePageIndicator2State extends State<CirclePageIndicator2> {
  int _currentPageIndex = 0;

  @override
  void initState() {
    widget.currentPageNotifier.addListener(() {
      setState(() {
        _currentPageIndex = widget.currentPageNotifier.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(widget.itemCount, (int index) {
        double size = widget.size;
        Color color = widget.dotColor;
        if (isSelected(index)) {
          size = widget.selectedSize;
          color = widget.selectedDotColor;
        }
        return GestureDetector(
          onTap: () => widget.onPageSelected == null
              ? null
              : widget.onPageSelected(index),
          child: Container(
            width: size + widget.dotSpacing,
            child: Material(
              color: color,
              type: MaterialType.circle,
              child: Container(
                width: size,
                height: size,
              ),
            ),
          ),
        );
      }),
    );
  }

  bool isSelected(int dotIndex) => _currentPageIndex == dotIndex;
}
