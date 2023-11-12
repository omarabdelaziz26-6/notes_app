import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharwat_notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:tharwat_notes_app/views/widgets/custom_app_bar_widget.dart';
import 'package:tharwat_notes_app/views/widgets/notes_list_view_widgets.dart';

class NotesHomeViewBody extends StatefulWidget {
  const NotesHomeViewBody({super.key});

  @override
  State<NotesHomeViewBody> createState() => _NotesHomeViewBodyState();
}

class _NotesHomeViewBodyState extends State<NotesHomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          children: [
            CustomAppBar(
              title: "Notes",
              icon: Icons.search,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: NotesListViewWidgets(),
            ),
          ],
        ),
      ),
    );
  }
}
