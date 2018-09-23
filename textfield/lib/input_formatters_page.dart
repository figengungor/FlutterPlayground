import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield/utils/demo_view.dart';
import 'utils/formatters.dart';

class InputFormattersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InputFormatters Demo')),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          _buildBlacklistingTextInputFormatterDemo(),
          _buildWhitelistingTextInputFormatterDemo(),
          _buildCustomUpperCaseTextInputFormatterDemo(),
        ],
      ),
    );
  }

  _buildBlacklistingTextInputFormatterDemo() {
    return DemoView(
      title: 'BlacklistingTextInputFormatter',
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'No vowel allowed'),
          inputFormatters: [
            //Can't type these vowels into TextField, they shall not pass!
            BlacklistingTextInputFormatter(RegExp("[aeiuüoöAEIİOÖUÜ]"))
          ],
        )
      ],
    );
  }

  _buildWhitelistingTextInputFormatterDemo() {
    return DemoView(
      title: 'WhitelistingTextInputFormatter',
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Only vowel allowed'),
          inputFormatters: [
            //Only vowels are allowed to pass!
            WhitelistingTextInputFormatter(RegExp("[aeiuüoö]"))
          ],
        )
      ],
    );
  }

  _buildCustomUpperCaseTextInputFormatterDemo() {
    return DemoView(
      title: 'Custom UpperCaseTextInputFormatter',
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'CAPSLOCK IS ON'),
          inputFormatters: [
            UpperCaseTextInputFormatter(),
          ],
        )
      ],
    );
  }
}
