class NoteForListing {
  String noteID;
  DateTime createDateTime;
  DateTime latestEditDateTime;
  String noteTitle;

  NoteForListing(this.noteID, this.noteTitle, this.createDateTime,
      this.latestEditDateTime);

//use this to convert json to list
  factory NoteForListing.jsonConvert(Map<String, dynamic> item) {
    return NoteForListing(
        item['noteID'],
        item['noteTitle'],
        DateTime.parse(item['createDateTime']),
        item['latestEditDateTime'] != null
            ? DateTime.parse(item['latestEditDateTime'])
            : null);
  }
}

class Note {
  String noteID;
  DateTime createDateTime;
  DateTime latestEditDateTime;
  String noteTitle;
  String noteContent;

  Note(this.noteID, this.noteTitle, this.createDateTime,
      this.latestEditDateTime, this.noteContent);

//use this to convert json to list
  factory Note.jsonConvert(Map<String, dynamic> item) {
    return Note(
        item['noteID'],
        item['noteTitle'],
        DateTime.parse(item['createDateTime']),
        item['latestEditDateTime'] != null
            ? DateTime.parse(item['latestEditDateTime'])
            : null,
        item['noteContent']);
  }
}

class PostNote {
  String noteTitle;
  String noteContent;

  PostNote(this.noteTitle, this.noteContent);

//use this to convert raw text to json
  Map<String, dynamic> jsonConvert() {
    return {"noteTitle": noteTitle, "noteContent": noteContent};
  }
}
