import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/helpers/fetch_all_notes_function.dart';
import 'package:tharwat_notes_app/models/note_model.dart';
import 'package:tharwat_notes_app/views/edit_note_view.dart';

void onDismissedFunction(DismissDirection direction, List<NoteModel> notes,
    int index, BuildContext context) {
  if (direction == DismissDirection.endToStart) {
    notes[index].delete();
    fetchAllNotesFunction(context);
  } else if (direction == DismissDirection.startToEnd) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => EditNoteView(note: notes[index]),
      ),
    );
  }
}
