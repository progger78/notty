import 'package:flutter/material.dart';

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
      required this.description,
      required this.title,
      this.timeToStart,
      this.timeToFinish,
      this.date,
      this.isHighPrior = true});
}

class Notes with ChangeNotifier {
  final List<Note> _notes = [
    Note(
        id: 'c1',
        title: 'To do laundry',
        date: DateTime.now(),
        description: 'Need to do for better shape and wonderful mood',
        isHighPrior: false),
    Note(
        id: 'c2',
        title: 'To hang out with friends',
        description: 'Need to do for better shape and wonderful mood',
        date: DateTime.now(),
        isHighPrior: true),
    Note(
        id: 'c3',
        title: 'To do homework',
        description: 'Need to do for better shape and wonderful mood',
        date: DateTime.now(),
        isHighPrior: true),
    Note(
        id: 'c4',
        title: 'To do sports',
        description: 'Need to do for better shape and wonderful mood',
        date: DateTime.now(),
        isHighPrior: true),
    Note(
        id: 'c5',
        title: 'To do some english',
        description: 'Need to do for better shape and wonderful mood',
        date: DateTime.now(),
        isHighPrior: false),
  ];
  List<Note> get notes => _notes;

  void deleteItem(String noteId) {
    _notes.removeWhere((element) => element.id == noteId);
    notifyListeners();
  }

  void addNote(
    bool isHighPrior,
    String title,
    String description,
   
  ) {
    _notes.insert(
      0,
      Note(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        date: DateTime.now(),
        isHighPrior: isHighPrior,
      ),
    );
    notifyListeners();
  }
}
