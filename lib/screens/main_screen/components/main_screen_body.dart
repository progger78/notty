import 'package:flutter/material.dart';

import 'package:my_todo/provider/notes.dart';



import 'package:provider/provider.dart';

import 'note_item.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesData = Provider.of<Notes>(context);

    
    return ListView.builder(
      itemCount: notesData.notes.length,
      itemBuilder: (BuildContext context, int index) {
        return NoteItem(note: notesData.notes[index]);
      },
    );
  }
}

