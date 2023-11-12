import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharwat_notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:tharwat_notes_app/helpers/custom_date_format_function.dart';
import 'package:tharwat_notes_app/models/note_model.dart';

void textFieldAddValidateFunction(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required AutovalidateMode autovalidateMode,
  required TextEditingController titleController,
  required TextEditingController subTitleController,
}) {
  autovalidateMode = AutovalidateMode.disabled;
  formKey.currentState!.save();
  NoteModel note = NoteModel(
    title: titleController.text,
    subTitle: subTitleController.text,
    date: customDateFormatFunction(
      dateAsString: DateTime.now().toString(),
    ),
    color: Colors.blue.value,
    lastEditDate: null,
  );
  titleController.clear();
  subTitleController.clear();
  BlocProvider.of<AddNoteCubit>(context).addNote(note);
}
