import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tharwat_notes_app/constants.dart';
import 'package:tharwat_notes_app/helpers/on_dismissed_function.dart';
import 'package:tharwat_notes_app/models/note_model.dart';
import 'package:tharwat_notes_app/views/widgets/dismissible_background_widget.dart';
import 'package:tharwat_notes_app/views/widgets/note_widgets.dart';

class FullListBody extends StatelessWidget {
  final List<NoteModel> notes;

  const FullListBody({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(notes[index].title),
          onDismissed: (direction) {
            onDismissedFunction(direction, notes, index, context);
          },
          secondaryBackground: const DismissibleBackground(
            color: Colors.red,
            icon: FontAwesomeIcons.trash,
          ),
          background: const DismissibleBackground(
            color: kPrimaryColor,
            icon: FontAwesomeIcons.penToSquare,
          ),
          child: NoteWidgets(
            note: notes[index],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 6,
        );
      },
    );
  }
}
