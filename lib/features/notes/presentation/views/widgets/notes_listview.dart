import 'package:flutter/widgets.dart';
import 'package:note_app/features/notes/presentation/views/widgets/note_item.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return const NoteItem();
    });
  }
}