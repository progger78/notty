import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_todo/exceptions/http_exceptions.dart';

class Note with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final DateTime? date;
  final TimeOfDay? timeToStart;
  final TimeOfDay? timeToFinish;
  bool isHighPrior;

  Note(
      {this.id,
      this.description,
      this.title,
      this.timeToStart,
      this.timeToFinish,
      this.date,
      this.isHighPrior = false});

  void _setNewValue(bool newValue) {
    isHighPrior = newValue;
    notifyListeners();
  }

  Future<void> markImportant(String authToken) async {
    final oldStatus = isHighPrior;
    isHighPrior = !isHighPrior;
    notifyListeners();
    final url = Uri.parse(
        'https://notty-57eed-default-rtdb.firebaseio.com/notes/$id.json?auth=$authToken');

    try {
      final response =
          await http.patch(url, body: jsonEncode({'isHighPrior': isHighPrior}));
      if (response.statusCode >= 400) {
        print(jsonDecode(response.body));
        _setNewValue(oldStatus);
      }
    } catch (e) {
      print(e.toString());
      _setNewValue(oldStatus);
    }
  }
}

class Notes with ChangeNotifier {
  List<Note> _notes = [
    // Note(
    //     id: 'c1',
    //     title: 'To do laundry',
    //     date: DateTime.now(),
    //     description: 'Need to do for better shape and wonderful mood',
    //     isHighPrior: false),
    // Note(
    //     id: 'c2',
    //     title: 'To hang out with friends',
    //     description: 'Need to do for better shape and wonderful mood',
    //     date: DateTime.now(),
    //     isHighPrior: true),
    // Note(
    //     id: 'c3',
    //     title: 'To do homework',
    //     description: 'Need to do for better shape and wonderful mood',
    //     date: DateTime.now(),
    //     isHighPrior: true),
    // Note(
    //     id: 'c4',
    //     title: 'To do sports',
    //     description: 'Need to do for better shape and wonderful mood',
    //     date: DateTime.now(),
    //     isHighPrior: true),
    // Note(
    //     id: 'c5',
    //     title: 'To do some english',
    //     description: 'Need to do for better shape and wonderful mood',
    //     date: DateTime.now(),
    //     isHighPrior: false),
  ];
  List<Note> get notes => _notes;

  final String authToken;
  final String userId;

  Notes(this._notes, this.authToken, this.userId);

  Future<void> deleteItem(String noteId) async {
    final url = Uri.parse(
        'https://notty-57eed-default-rtdb.firebaseio.com/notes/$noteId.json?auth=$authToken');
    final existingProductIndex =
        _notes.indexWhere((element) => element.id == noteId);
    final existingProduct = _notes[existingProductIndex];
    _notes.removeWhere((element) => element.id == noteId);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _notes.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Deletion has failed');
    }
  }

  Future<void> fetchAndSetNotes() async {
    final url = Uri.parse(
        'https://notty-57eed-default-rtdb.firebaseio.com/notes.json?auth=$authToken&orderBy="creatorId"&equalTo="$userId"');
    try {
      final result = await http.get(url);

      final List<Note> loadedNotes = [];
      final extractedData = jsonDecode(result.body) as Map<String, dynamic>;
      if (extractedData.isEmpty) {
        return;
      }
      extractedData.forEach((noteId, value) {
        loadedNotes.add(
          Note(
            id: noteId,
            description: value['description'],
            title: value['title'],
            isHighPrior: value['isHighPrior'],
            date: DateTime.parse(value['date']),
          ),
        );
      });
      _notes = loadedNotes;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addNote(
      bool isHighPrior, String title, String description, String date) async {
    final url = Uri.parse(
        'https://notty-57eed-default-rtdb.firebaseio.com/notes.json?auth=$authToken');
    try {
      final result = await http.post(
        url,
        body: jsonEncode(
          {
            'title': title,
            'description': description,
            'isHighPrior': isHighPrior,
            'date': date,
            'creatorId': userId,
          },
        ),
      );
      print(jsonDecode(result.body));
      _notes.insert(
        0,
        Note(
          id: jsonDecode(result.body)['name'],
          title: title,
          description: description,
          date: DateTime.now(),
          isHighPrior: isHighPrior,
        ),
      );
      notifyListeners();
    } catch (e) {
      rethrow;
    }

    
  }
}
