import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:note_app/features/notes/presentation/manger/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'note_item.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, List<NoteModel>>(
      builder: (context, notes) {
        if (notes.isEmpty) {
          return const Center(
            child: Text(
              'Start adding your notes',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white54,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => NoteItem(note: notes[index]),
                  childCount: notes.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
