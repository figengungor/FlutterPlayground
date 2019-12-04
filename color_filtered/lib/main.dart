import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ColorFiltered Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _selectedColor = Colors.red;
  BlendMode _selectedBlendMode = BlendMode.modulate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColorFiltered'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: FittedBox(
                    child: RaisedButton.icon(
                        onPressed: _showColorPickerDialog,
                        icon: Icon(Icons.palette),
                        label: Row(
                          children: <Widget>[
                            Text('Pick a color'),
                            const SizedBox(width: 16),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: _selectedColor),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: FittedBox(
                    child: DropdownButton<BlendMode>(
                     underline: const SizedBox(),
                        value: _selectedBlendMode,
                        items: _getBlendModeDropDownItems(),
                        onChanged: _changeBlendMode),
                  ),
                )
              ],
            ),
            ColorFiltered(
              colorFilter: ColorFilter.mode(_selectedColor, _selectedBlendMode),
              child: Column(
                children: <Widget>[
                  SizedBox(
                      height: 200, child: Image.asset('assets/dog_vector.png')),
                  const SizedBox(height: 16),
                  Image.asset('assets/dog.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeColor(Color value) {
    setState(() {
      _selectedColor = value;
    });
  }

  void _changeBlendMode(BlendMode value) {
    setState(() {
      _selectedBlendMode = value;
    });
  }

  void _showColorPickerDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: _selectedColor,
                  onColorChanged: _changeColor,
                  enableLabel: true,
                  pickerAreaHeightPercent: 0.2,
                ),
              ),
            ));
  }

  List<DropdownMenuItem<BlendMode>> _getBlendModeDropDownItems() {
    return BlendMode.values
        .map(
          (mode) => DropdownMenuItem<BlendMode>(
            child: Text(mode.toString()),
            value: mode,
          ),
        )
        .toList();
  }
}
