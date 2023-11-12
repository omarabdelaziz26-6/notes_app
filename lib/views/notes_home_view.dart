import 'package:flutter/material.dart';
import 'package:tharwat_notes_app/views/widgets/modal_bottom_sheet_body.dart';
import 'package:tharwat_notes_app/views/widgets/notes_home_view_body.dart';

class NotesHomeView extends StatelessWidget {
  const NotesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            context: context,
            builder: (context) => const ModalBottomSheetBody(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesHomeViewBody(),
    );
  }
}
