import 'dart:convert';

import 'package:layouts/models/api-response.dart';
import 'package:layouts/models/notemodel.dart';
import 'package:http/http.dart' as http;

class NotesServices {
  static const baseUrl = 'http://api.notes.programmingaddict.com/';
  static const headers = {
    'apiKey': '08d799b3-ae81-3a20-10a4-09ff58a7f9dc',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<List<NoteForListing>>> getNotes() {
    return http.get(baseUrl + 'notes', headers: headers).then((data) {
      //check if api call returned 200
      if (data.statusCode == 200) {
        //convert data to a map type
        final jsonData = json.decode(data.body);
        //convert the map into the actual real list of objects
        final notesList = <NoteForListing>[];
        //add each content of the map into a list of NoteForListing
        for (var item in jsonData) {
          //add each converted content to the list defined above
          notesList.add(NoteForListing.jsonConvert(item));
        }
        return APIResponse<List<NoteForListing>>(data: notesList);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occured!');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured!'));
  }

  Future<APIResponse<Note>> getNote(String id) {
    return http.get(baseUrl + 'notes/' + id, headers: headers).then((data) {
      //check if api call returned 200
      if (data.statusCode == 200) {
        //convert data to a map type
        final jsonData = json.decode(data.body);
        final note = Note.jsonConvert(jsonData);
        return APIResponse<Note>(data: note);
      }
      return APIResponse<Note>(error: true, errorMessage: 'An error occured!');
    }).catchError((_) => APIResponse<NoteForListing>(
        error: true, errorMessage: 'An error occured!'));
  }

  Future<APIResponse<bool>> postNote(PostNote newNote) {
    return http
        .post(baseUrl + 'notes/',
            headers: headers, body: json.encode(newNote.jsonConvert()))
        .then((data) {
      //check if api call returned 200
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured!');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured!'));
  }

  Future<APIResponse<bool>> putNote(String noteID, PostNote newNote) {
    return http
        .put(baseUrl + 'notes/' + noteID,
            headers: headers, body: json.encode(newNote.jsonConvert()))
        .then((data) {
      //check if api call returned success
      if (data.statusCode == 200 || data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured!');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured!'));
  }

  Future<APIResponse<bool>> deleteNote(String noteID) {
    return http
        .delete(baseUrl + 'notes/' + noteID, headers: headers)
        .then((data) {
      //check if api call returned success
      if (data.statusCode == 200 || data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured!');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'An error occured!'));
  }
}
