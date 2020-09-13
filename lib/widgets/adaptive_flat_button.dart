import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final Function _onPressedHandler;
  final String _buttonText;

  AdaptiveFlatButton(this._buttonText, this._onPressedHandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(_buttonText),
            onPressed: _onPressedHandler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              _buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _onPressedHandler,
          );
  }
}
