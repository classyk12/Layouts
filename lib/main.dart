import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:layouts/Widgets/customTextField.dart';
import 'package:layouts/note_screens/note_list.dart';
import 'package:layouts/services/note_services.dart';
import 'design2/design2.dart';
import 'design3/design3.dart';
import 'note_screens/note_modify.dart';

//use this to initialize service locator
void setupLocator() {
  GetIt.I.registerLazySingleton(() => NotesServices());
}

void main() {
  setupLocator();
  runApp(MaterialApp(
    title: 'Login UI',
    onGenerateRoute: _routes(),
  ));
}

const Design1Route = '/design1';
const NoteRoute = '/';
const AddNoteRoute = '/addnote';
const Design2Route = '/design2';
const Design3Route = '/design3';

//use this to define routes globally: all routes will be defined here
RouteFactory _routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    Widget screen;

    switch (settings.name) {
      case Design1Route:
        screen = HomeScreen();
        break;

      case Design2Route:
        screen = Design2Screen();
        break;

      case Design3Route:
        screen = Design3Screen();
        break;

      case NoteRoute:
        screen = NotesList();
        break;

      case AddNoteRoute:
        screen = NoteAction(noteId: arguments['id']);
        break;

      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //use this method to get height and width of screen
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomRight,
                  heightFactor: 0.5,
                  widthFactor: 0.6,
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(250)),
                    elevation: 20.0,
                    color: Color.fromRGBO(255, 255, 255, 0.4),
                    child: Container(
                      height: 500,
                      width: 500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.5,
                  widthFactor: 0.6,
                  child: Material(
                    borderRadius: BorderRadius.all(Radius.circular(250)),
                    elevation: 10.0,
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                    child: Container(
                      height: 300,
                      width: 300,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 500,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.all(Radius.circular(60.0)),
                          elevation: 30.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/flutter-logo.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        CustomTextField('username', Icons.person),
                        CustomTextField('password', Icons.lock),
                        Container(
                            width: 200,
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              textColor: Colors.white,
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/design2'),
                              color: Colors.deepOrange,
                              child: Text(
                                'Go to Design 2',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
