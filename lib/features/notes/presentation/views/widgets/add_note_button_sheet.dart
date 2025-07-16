import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
      child: Column(
        children: [
          CustomTextField(
            labelText: "title",
            hintText: "write your title here",
          ),
          SizedBox(height: 25,),
          CustomTextField(
             maxLines: 5,
            labelText: "content",
            hintText: "write your note here",
           
          ),
        ],
      ),
    );
  }
}