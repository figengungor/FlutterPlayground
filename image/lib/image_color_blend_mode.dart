import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:easy_dialogs/single_choice_dialog.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';

class ImageColorBlendMode extends StatefulWidget {
  @override
  ImageColorBlendModeState createState() {
    return new ImageColorBlendModeState();
  }
}

class ImageColorBlendModeState extends State<ImageColorBlendMode> {
  final List<BlendMode> _blendModes = BlendMode.values;
  BlendMode _selectedBlendMode = BlendMode.darken;
  Color _pickerColor = Colors.black87;
  Color _selectedColor = Colors.black87;
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('colorBlendMode'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: _openInfoDialog,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Image.asset(
                "assets/images/sir.jpg",
                fit: BoxFit.cover,
              ),
              Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  child: RaisedButton(
                    child: Text('Choose Color'),
                    onPressed: _openColorPicker,
                  )),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: RaisedButton(
                  child: Text('Choose BlendMode'),
                  onPressed: _openBlendModePicker,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: Colors.black87,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Color: ARGB(${_selectedColor.alpha}, ${_selectedColor.red}, '
                              '${_selectedColor.green}, ${_selectedColor.blue})',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        ArrowPageIndicator(
                          iconPadding: EdgeInsets.all(0.0),
                          iconColor: Colors.white,
                          isJump: true,
                          pageController: _pageController,
                          currentPageNotifier: _currentPageNotifier,
                          itemCount: _blendModes.length,
                          child: _buildPageView(
                              _pageController, _currentPageNotifier),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/sir.jpg",
                        fit: BoxFit.cover,
                        color: _selectedColor,
                        colorBlendMode: _selectedBlendMode,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _pickerColor,
              onColorChanged: _changeColor,
              colorPickerWidth: 1000.0,
              pickerAreaHeightPercent: 0.7,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Got it'),
              onPressed: () {
                setState(() => _selectedColor = _pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _openBlendModePicker() {
    showDialog(
        context: context,
        builder: (context) {
          return SingleChoiceDialog<BlendMode>(
            title: Text(
              'Select a BlendMode',
              style: TextStyle(color: Colors.pink),
            ),
            items: _blendModes,
            onSelected: _changeBlendMode,
            itemBuilder: (BlendMode blendMode) {
              return ListTile(title: Text(blendMode.toString()));
            },
          );
        });
  }

  void _changeColor(Color color) {
    setState(() => _pickerColor = color);
  }

  void _changeBlendMode(BlendMode value) {
    setState(() => _selectedBlendMode = value);
  }

  void _openInfoDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.blue,
                ),
                title: Text(
                  'Information'.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              content: Text('In terms of the blend mode, [color] is '
                  'the source and this image is the destination.'),
            ));
  }

  _buildPageView(
      PageController pageController, ValueNotifier<int> currentPageNotifier) {
    return Container(
      height: 50.0,
      child: PageView.builder(
          itemCount: _blendModes.length,
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Text(
                '${_blendModes[index]}',
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.center,
              ),
            );
          },
          onPageChanged: (int index) {
            currentPageNotifier.value = index;
            setState(() => _selectedBlendMode = _blendModes[index]);
          }),
    );
  }
}
