import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/constants.dart';
import 'package:tharwat_notes_app/helpers/fetch_all_notes_function.dart';
import 'package:tharwat_notes_app/models/note_model.dart';
import 'package:tharwat_notes_app/views/widgets/circle_color_widget.dart';

class EditColorColorsListView extends StatefulWidget {
  final NoteModel note;

  const EditColorColorsListView({super.key, required this.note});

  @override
  State<EditColorColorsListView> createState() =>
      _EditColorColorsListViewState();
}

class _EditColorColorsListViewState extends State<EditColorColorsListView> {
  late int currentColor;
  @override
  void initState() {
    currentColor = widget.note.color;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 60,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentColor = kColorsList[index].value;
              });
              widget.note.color = currentColor;
              widget.note.save();
              fetchAllNotesFunction(context);
            },
            child: CircleColorWidget(
              color: kColorsList[index],
              isSelectedColor: currentColor == kColorsList[index].value,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: kColorsList.length,
      ),
    );
  }
}
