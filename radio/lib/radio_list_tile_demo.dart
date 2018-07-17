import 'package:flutter/material.dart';

class RadioListTileDemo extends StatefulWidget {
  @override
  _RadioListTileDemoState createState() => _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  _Experience _selectedExperience;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioListTile Demo'),
      ),
      body: _getBody(),
    );
  }

  _getBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Choose your experience',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Column(
            children: _getExperienceRadioButtons(),
          ),
          Expanded(
            child: Center(
                child: Text(
                  _selectedExperience == null ? '?' : _selectedExperience.type,
              style: TextStyle(fontSize: 50.0),
            )),
          )
        ],
      ),
    );
  }

  _getExperienceRadioButtons() {
    return _experienceList
        .map((experience) => Column(
              children: <Widget>[
                RadioListTile(
                  title: Text('${experience.type}'),
                  subtitle: Text('${experience.description}'),
                  activeColor: Colors.pink,
                  secondary: Text('Id: ${experience.id}'),
                  value: experience,
                  groupValue: _selectedExperience,
                  onChanged: (value) {
                    setState(() {
                      _selectedExperience = value;
                    });
                  },
                ),
              ],
            ))
        .toList();
  }
}

final _experienceList = [
  _Experience('0', 'Beginner', 'Just started'),
  _Experience('1', 'Intermediate', '1-3 years'),
  _Experience('2', 'Expert', '>=3 years'),
];

class _Experience {
  _Experience(this.id, this.type, this.description);

  final String id;
  final String type;
  final String description;
}
