import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;
  //create a constructor that allows us to customize our path
  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      constraints: BoxConstraints.expand(height: 300.0),
      decoration: BoxDecoration(color: Colors.grey),
      child: Image.asset(_assetPath, fit: BoxFit.cover),
    );
  }
}
