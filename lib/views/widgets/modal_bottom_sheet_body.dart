import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharwat_notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:tharwat_notes_app/helpers/fetch_all_notes_function.dart';
import 'package:tharwat_notes_app/views/widgets/modal_add_note_form_body.dart';

class ModalBottomSheetBody extends StatelessWidget {
  const ModalBottomSheetBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            log("state is ${state.errMsg}");
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            fetchAllNotesFunction(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const AddNoteFormBody(),
            ),
          );
        },
      ),
    );
  }
}
