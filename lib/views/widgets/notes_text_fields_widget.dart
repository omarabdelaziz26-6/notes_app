import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/views/widgets/custom_text_field_widget.dart';

class NotesTextFields extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController subTitleController;

  const NotesTextFields(
      {super.key,
      required this.titleController,
      required this.subTitleController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          labelText: "Note Title",
          controller: titleController,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          labelText: "Note Content",
          maxLines: 5,
          controller: subTitleController,
        ),
      ],
    );
  }
}
