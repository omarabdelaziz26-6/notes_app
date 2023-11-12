import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/models/note_model.dart';
import 'package:tharwat_notes_app/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel note;

  const EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
