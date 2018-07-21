import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';

getErrorMessage(Object error, VoidCallback onRetryPressed) {
  var errorMessage;
  if (error is TimeoutException) {
    errorMessage = 'Time out';
  } else if (error is IOException) {
    errorMessage = 'No Internet Connection';
  } else {
    errorMessage = error.toString();
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "$errorMessage",
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 16.0,
      ),
      RaisedButton(
        onPressed: onRetryPressed,
        child: Text('Retry'),
      ),
    ],
  );
}
