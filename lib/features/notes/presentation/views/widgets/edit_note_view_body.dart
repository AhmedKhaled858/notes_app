import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_text_field.dart';
import '../../../../../core/utiles/widgets/custom_appbar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppbar(
            title: "Edit Note",
            icon: Icons.done,
            iconButton: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (GoRouter.of(context).canPop()) {
                context.pop();
              } else {
                context.go('/notes'); 
              }
            },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              children: const [
                CustomTextField(
                  labelText: "title",
                  hintText: "write your title here",
                ),
                SizedBox(height: 25),
                CustomTextField(
                  labelText: "content",
                  hintText: "write your note here",
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
