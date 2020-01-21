import 'package:flutter/material.dart';

class ShowMessageDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final Function buttonAction;

  ShowMessageDialog(
      this.title, this.content, this.buttonText, this.buttonAction);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: buttonAction,
          child: Text(buttonText),
        )
      ],
    );
  }
}
