import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharwat_notes_app/cubits/notes_cubit/notes_cubit.dart';

void fetchAllNotesFunction(BuildContext context) {
  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
}
