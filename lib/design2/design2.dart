import 'package:flutter/material.dart';
import 'package:layouts/Widgets/imagebanner.dart';
import 'package:layouts/styles.dart';

class Design2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Design 2'),
      // ),
      body: Design2(),
    );
  }
}

class Design2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ImageBanner('assets/images/santiago.jpg'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Oeschienen Lake Campground',
                    style: TitleStyle,
                  ),
                  Text(
                    'Kanderstag, Switzerland',
                    style: SubSection,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.star, color: Colors.red, size: 30.0),
                  Text(
                    '41',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.phone, color: Colors.blue),
                  ),
                  Text(
                    'CALL',
                    style: MenuStyle,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.place, color: Colors.blue),
                  ),
                  Text(
                    'ROUTE',
                    style: MenuStyle,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.share, color: Colors.blue),
                  ),
                  Text(
                    'SHARE',
                    style: MenuStyle,
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true,
            style: BodyStyle,
          ),
        ),
        FlatButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () => Navigator.pushNamed(context, '/design3'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('Next Design'), Icon(Icons.navigate_next)],
          ),
        )
      ],
    );
  }
}
