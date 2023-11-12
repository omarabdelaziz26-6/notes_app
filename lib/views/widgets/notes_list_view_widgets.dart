import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharwat_notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:tharwat_notes_app/models/note_model.dart';
import 'package:tharwat_notes_app/views/widgets/empty_list_body.dart';
import 'package:tharwat_notes_app/views/widgets/full_list_body.dart';

class NotesListViewWidgets extends StatelessWidget {
  const NotesListViewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notesList ?? [];
        return notes.isEmpty
            ? const EmptyListBody()
            : FullListBody(notes: notes);
      },
    );
  }
}
