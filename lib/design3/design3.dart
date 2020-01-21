import 'package:flutter/material.dart';
import 'package:layouts/models/dogmodel.dart';

//fecth dog details
final allDogs = Dogs.getAll();

class Design3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('We Rate Dogs'),
        centerTitle: true,
      ),
      body: Design3(),
    );
  }
}

class Design3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: allDogs.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Material(
                  elevation: 10.0,
                  color: Colors.black87,
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        allDogs[index].image,
                        height: 100.0,
                        width: 100.0,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            allDogs[index].name,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            allDogs[index].location,
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.white),
                              Text(
                                ':',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                allDogs[index].rating,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
