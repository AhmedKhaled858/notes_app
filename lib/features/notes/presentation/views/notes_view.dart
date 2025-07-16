import 'package:flutter/material.dart';
import 'package:note_app/features/notes/presentation/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        onPressed: () {
          // Handle add new note
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}