import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:layouts/models/notemodel.dart';
import 'package:layouts/services/note_services.dart';

class NoteAction extends StatefulWidget {
  final String noteId;
  NoteAction({this.noteId});

  @override
  NoteActionState createState() => NoteActionState();
}

class NoteActionState extends State<NoteAction> {
  //check if an id is present from the predecessor widget
  bool get _isEditing => widget.noteId != null;
  String errorMessage;
  Note note;
  NotesServices get service => GetIt.I<NotesServices>();
  bool _isLoading = false;

  //create Textfield Controllers
  var titleController = new TextEditingController();
  var noteContentController = new TextEditingController();

  //call the service on widget initialization
  @override
  void initState() {
    if (_isEditing) {
      fecthNote();
    }
    super.initState();
  }

  void fecthNote() async {
    setState(() {
      _isLoading = true;
    });
    await service.getNote(widget.noteId).then((response) {
      setState(() {
        _isLoading = false;
      });

      if (response.error) {
        errorMessage = response.errorMessage ?? 'An error occured';
      }
      note = response.data;
      titleController.text = note.noteTitle;
      noteContentController.text = note.noteContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_isEditing ? 'Edit Note' : 'Create Note'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              )
            : Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(                      
                      controller: titleController,
                      decoration: InputDecoration(hintText: 'Note Title'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: noteContentController,
                      decoration: InputDecoration(hintText: 'Note Content'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: RaisedButton(
                        onPressed: () async {
                          //check if fields are empty
                          if (titleController.text.isEmpty) {
                            //show a dialog
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text('error'),
                                      content: Text('fields cannot be empty'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ));
                            return;
                          }

                          if (_isEditing) {
                            setState(() {
                              _isLoading = true;
                            });
                            //build note object
                            final noteObject = new PostNote(
                                titleController.text,
                                noteContentController.text);

                            final result =
                                await service.putNote(note.noteID, noteObject);
                            setState(() {
                              _isLoading = false;
                            });
                            final title = result.data ? 'Done!' : 'Error!';
                            final content = result.error
                                ? (result.errorMessage ?? 'An error occured!')
                                : 'Noted updated';

                            //show a dialog
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text(title),
                                      content: Text(content),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    )).then((data) {
                              if (result.data) {
                                Navigator.of(context).pop();
                              }
                            });

                            //do editing here
                          } else {
                            setState(() {
                              _isLoading = true;
                            });
                            //build note object
                            final note = new PostNote(titleController.text,
                                noteContentController.text);

                            final result = await service.postNote(note);
                            setState(() {
                              _isLoading = false;
                            });
                            final title = result.data ? 'Done!' : 'Error!';
                            final content = result.error
                                ? (result.errorMessage ?? 'An error occured!')
                                : 'Noted saved';

                            //show a dialog
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: Text(title),
                                      content: Text(content),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    )).then((data) {
                              if (result.data) {
                                Navigator.of(context).pop();
                              }
                            });
                          }
                        },
                        textColor: Colors.white,
                        color: Colors.red,
                        child: Text(
                          _isEditing ? 'Update' : 'Submit',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
