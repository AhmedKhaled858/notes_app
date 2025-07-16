import 'package:flutter/material.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_add_button.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 25,
        top: 25,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            CustomTextField(
              labelText: "title",
              hintText: "write your title here",
            ),
            SizedBox(height: 25),
            CustomTextField(
              maxLines: 5,
              labelText: "content",
              hintText: "write your note here",
            ),
            SizedBox(height: 60),
            CustomAddButton(),
          ],
        ),
      ),
    );
  }
}
