import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/widgets/custom_appbar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: CustomAppbar(),
        ),
      ],),
    );
  }
}