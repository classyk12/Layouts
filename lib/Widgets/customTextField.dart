import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  CustomTextField(this.hintText, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          elevation: 5.0,
          color: Colors.deepOrange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  this.icon,
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                width: 300,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: this.hintText,
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true),
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
