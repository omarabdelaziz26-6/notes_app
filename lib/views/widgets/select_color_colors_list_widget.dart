import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tharwat_notes_app/constants.dart';
import 'package:tharwat_notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:tharwat_notes_app/views/widgets/circle_color_widget.dart';

class SelectColorColorsListView extends StatefulWidget {
  const SelectColorColorsListView({super.key});
  @override
  State<SelectColorColorsListView> createState() =>
      _SelectColorColorsListViewState();
}

class _SelectColorColorsListViewState extends State<SelectColorColorsListView> {
  int currentColor = Colors.red.value;

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
              BlocProvider.of<AddNoteCubit>(context).color = currentColor;
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
