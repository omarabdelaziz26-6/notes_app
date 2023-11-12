import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/helpers/custom_edit_date_format_function.dart';
import 'package:tharwat_notes_app/helpers/fetch_all_notes_function.dart';
import 'package:tharwat_notes_app/models/note_model.dart';
import 'package:tharwat_notes_app/views/notes_home_view.dart';

void textFieldEditValidateFunction(
    {required BuildContext context,
    required NoteModel note,
    required TextEditingController titleController,
    required TextEditingController subTitleController,
    required GlobalKey<FormState> formKey}) {
  if (note.title != titleController.text ||
      note.subTitle != subTitleController.text) {
    note.title = titleController.text;
    note.lastEditDate =
        customEditDateFormatFunction(dateAsString: DateTime.now().toString());
    note.subTitle = subTitleController.text;
    note.save();
    fetchAllNotesFunction(context);
  }
  titleController.text = "";
  subTitleController.text = "";
  formKey.currentState!.save();
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const NotesHomeView(),
    ),
  );
}
