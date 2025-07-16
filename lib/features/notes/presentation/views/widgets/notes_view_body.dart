import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/widgets/custom_appbar.dart';
import 'package:note_app/features/notes/presentation/views/widgets/notes_listview.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppbar(),
            ),
            NotesListview()
          
          ],
        ),
      ),
    );
  }
}