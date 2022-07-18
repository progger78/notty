import 'package:flutter/material.dart';

import 'package:my_todo/provider/notes.dart';
import 'package:my_todo/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'note_item.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Notes>(context, listen: false).fetchAndSetNotes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            showDialog(
              context: context,
              builder: (ctx) {
                return CustomAlertDialog(
                    context: context, content: 'Something went wrong');
              },
            );
          }
          return Consumer<Notes>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.notes.length,
              itemBuilder: (BuildContext context, int index) {
                return ChangeNotifierProvider.value(
                    value: value.notes[index], child: const NoteItem());
              },
            ),
          );
        });
  }
}
