import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/constants.dart';
import 'package:tharwat_notes_app/helpers/text_field_edit_validate_function.dart';
import 'package:tharwat_notes_app/models/note_model.dart';
import 'package:tharwat_notes_app/views/widgets/edit_color_colors_list_widget.dart';
import 'package:tharwat_notes_app/views/widgets/custom_app_bar_widget.dart';
import 'package:tharwat_notes_app/views/widgets/notes_text_fields_widget.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;

  const EditNoteViewBody({super.key, required this.note});
  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (titleController.text == "" && subTitleController.text == "") {
      titleController.text = widget.note.title;
      subTitleController.text = widget.note.subTitle;
    }
    return SafeArea(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            children: [
              CustomAppBar(
                title: "Edit Note",
                icon: Icons.done_rounded,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      autovalidateMode = AutovalidateMode.disabled;
                    });
                    textFieldEditValidateFunction(
                      context: context,
                      note: widget.note,
                      titleController: titleController,
                      subTitleController: subTitleController,
                      formKey: formKey,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              NotesTextFields(
                titleController: titleController,
                subTitleController: subTitleController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Note Color",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              EditColorColorsListView(
                note: widget.note,
              )
            ],
          ),
        ),
      ),
    );
  }
}
