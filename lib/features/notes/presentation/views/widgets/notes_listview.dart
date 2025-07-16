import 'package:flutter/widgets.dart';
import 'note_item.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomScrollView(
        slivers: [ SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => const NoteItem(),
            childCount: 10,
          ),
        ),],
        
      ),
    );
  }
}
