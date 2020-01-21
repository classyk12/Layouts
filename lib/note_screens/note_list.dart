import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:layouts/helpers/datehelper.dart';
import 'package:layouts/models/api-response.dart';
import 'package:layouts/models/notemodel.dart';
import 'package:layouts/services/note_services.dart';

class NotesList extends StatefulWidget {
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NotesList> {
  //register the get_it service
  NotesServices get service => GetIt.I<NotesServices>();
  //define a field to show status of our response
  APIResponse<List<NoteForListing>> _apiResponse;
  bool _isLoading = false;

//call the service on widget initialization
  @override
  void initState() {
    fetchNotes();
    super.initState();
  }

  //use this method to fecth notes on startup
  void fetchNotes() async {
    //use this when you are sure your request alters the state of the user interface so the widget can be notified of it
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await service.getNotes();
    if (_apiResponse.error) {
      Center(child: Text(_apiResponse.errorMessage));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, '/addnote', arguments: {"id": null})
                .then((_) {
          fetchNotes();
        }),
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_isLoading
            ? 'All Notes'
            : 'All Notes (${_apiResponse.data.length})'),
      ),
      body: Builder(builder: (_) {
        //check if its currently loading
        if (_isLoading) {
          return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.red));
        }

        //check if there was an error during loading of data
        if (_apiResponse.error) {
          return Center(
            child: Text(_apiResponse.errorMessage),
          );
        }

        //check if no notes are found
        if (_apiResponse.data.length <= 0) {
          return Center(
            child: Text('No Notes found'),
          );
        }

        return Container(
          child: ListView.separated(
              separatorBuilder: (_, __) => Divider(
                    height: 1.0,
                    color: Colors.blueGrey,
                  ),
              padding: EdgeInsets.all(10.0),
              itemCount: _apiResponse.data.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    background: Container(
                      alignment: AlignmentDirectional.centerStart,
                      color: Colors.red,
                      child: Icon(Icons.delete_forever, color: Colors.white),
                    ),
                    // secondaryBackground:
                    //     Icon(Icons.delete_forever, color: Colors.white),
                    resizeDuration: Duration(milliseconds: 200),
                    key: Key('item'),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) async {
                      setState(() {
                        _isLoading = true;
                      });
                      //delete from web service
                      final result = await service
                          .deleteNote(_apiResponse.data[index].noteID);
                      setState(() {
                        _isLoading = false;
                      });
                      //check if true and remove from listvirew
                      if (result.data) {
                        _apiResponse.data.removeAt(index);
                        //show a dialog
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text('Done!'),
                                  content: Text('Note Removed Successfully'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        fetchNotes();
                                      },
                                    )
                                  ],
                                ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text('error!'),
                                  content: Text(result.errorMessage ??
                                      'Something went wrong!'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        fetchNotes();
                                      },
                                    )
                                  ],
                                ));
                      }
                    },
                    child: ListTile(
                        title: Text(
                          _apiResponse.data[index].noteTitle,
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.redAccent),
                        ),
                        subtitle: Row(children: <Widget>[
                          Text('date created: ',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.black)),
                          Text(
                              DateHelper.formatDate(
                                  _apiResponse.data[index].createDateTime),
                              style:
                                  TextStyle(fontSize: 15.0, color: Colors.grey))
                        ]),
                        onTap: () => Navigator.pushNamed(context, '/addnote',
                                arguments: {
                                  "id": _apiResponse.data[index].noteID
                                }).then((_) {
                              fetchNotes();
                            })));
              }),
        );
      }),
    );
  }
}
