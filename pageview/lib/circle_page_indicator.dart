import 'package:flutter/material.dart';

class CirclePageIndicator extends StatelessWidget {
  /// The current page index
  final int currentPageIndex;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  ///The dot color
  final Color dotColor;

  ///The selected dot color
  final Color selectedDotColor;

  ///Selected dot is displayed bigger if set to true
  final isSelectedBigger;

  final double radius;

  final double dotSpacing;

  CirclePageIndicator({
    Key key,
    @required this.currentPageIndex,
    @required this.itemCount,
    this.onPageSelected,
    this.radius = 8.0,
    this.dotSpacing = 8.0,
    this.dotColor = Colors.black,
    this.selectedDotColor = Colors.blue,
    this.isSelectedBigger = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        double size = radius * 2;
        Color color = dotColor;
        if (isSelected(index)) {
          if (isSelectedBigger) size = size * 3;
          color = selectedDotColor;
        }
        return GestureDetector(
          onTap: () => onPageSelected == null ? null : onPageSelected(index),
          child: Container(
            width: size + dotSpacing,
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

  bool isSelected(int dotIndex) => currentPageIndex == dotIndex;
}
