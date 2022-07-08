import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'components/add_note_body.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
      ),
      body:  AddNoteBody(),
    );
  }
}
