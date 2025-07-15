import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/widgets/custom_appbar.dart';
import 'package:note_app/features/notes/presentation/views/widgets/note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: Column(
          children: [
          CustomAppbar(),
          SizedBox(height: 16,),
          NoteItem(),
        ],),
      ),
    );
  }
}