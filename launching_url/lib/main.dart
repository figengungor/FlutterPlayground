import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Launching Url Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static final String url = 'https://flutter.io';
  static final String emailAddress = 'blabla@blabla.com';
  static final String subject = 'Flutter News';
  static final String body = 'Have you met Flutter?';
  static final String phoneNumber = '1234567890';

  final _navItems = [
    NavItem('Open Browser', _openBrowser),
    NavItem('Open WebView', _openWebView),
    NavItem('Send Email', _sendEmail),
    NavItem('Call Phone', _callPhone),
    NavItem('Send Sms', _sendSms),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Launching Url Playground'),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView(
      children: _navItems
          .map((item) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text(item.title),
                  onPressed: item.onPressed,
                ),
              ))
          .toList(),
    );
  }

  static _openBrowser() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Can't launch $url";
    }
  }

  //Can't control much this one
  static _openWebView() async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: true,
      );
    } else {
      throw "Can't launch $url";
    }
  }

  static _sendEmail() async {
    String email = 'mailto:$emailAddress?subject=$subject&body=$body';
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw "Can't launch $email";
    }
  }

  static _callPhone() async {
    String phone = 'tel:$phoneNumber';
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw "Can't launch $phone";
    }
  }

  //doesn't open a new activity
  //it removes the first number in phone number???
  static _sendSms() async {
    String sms = 'sms:$phoneNumber';
    if (await canLaunch(sms)) {
      await launch(sms);
    } else {
      throw "Can't launch $sms";
    }
  }
}

class NavItem {
  NavItem(this.title, this.onPressed);

  final String title;
  final Function onPressed;
}
