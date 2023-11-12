import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharwat_notes_app/constants.dart';
import 'package:tharwat_notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:tharwat_notes_app/helpers/text_feild_add_validate_function.dart';
import 'package:tharwat_notes_app/views/widgets/notes_text_fields_widget.dart';
import 'package:tharwat_notes_app/views/widgets/select_color_colors_list_widget.dart';
import 'package:tharwat_notes_app/views/widgets/custom_button_widget.dart';

class AddNoteFormBody extends StatefulWidget {
  const AddNoteFormBody({
    super.key,
  });
  @override
  State<AddNoteFormBody> createState() => _AddNoteFormBodyState();
}

class _AddNoteFormBodyState extends State<AddNoteFormBody> {
  int selectedColorValue = Colors.blue.value;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            NotesTextFields(
                titleController: titleController,
                subTitleController: subTitleController),
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
            const SelectColorColorsListView(),
            const SizedBox(
              height: 35,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      textFieldAddValidateFunction(
                        context,
                        formKey: formKey,
                        autovalidateMode: autovalidateMode,
                        titleController: titleController,
                        subTitleController: subTitleController,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
