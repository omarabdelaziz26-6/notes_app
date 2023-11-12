import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tharwat_notes_app/constants.dart';
import 'package:tharwat_notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  int color = Colors.red.value;
  void addNote(NoteModel note) async {
    note.color = color;
    emit(AddNoteLoading());
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } on HiveError catch (e) {
      emit(AddNoteFailure(errMsg: e.toString()));
    } catch (e) {
      emit(AddNoteFailure(errMsg: e.toString()));
    }
  }
}
