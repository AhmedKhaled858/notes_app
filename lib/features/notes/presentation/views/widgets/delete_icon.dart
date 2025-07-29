import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../data/models/note_model.dart';
import '../../manger/cubits/notes_cubit/cubit/notes_cubit.dart';

class DeleteIcon extends StatelessWidget {
    final NoteModel note;
  const DeleteIcon({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.delete, color: Colors.white, size: 24),
      onPressed: () {
        //من الاخر مينفعش ابني context داخل الديالوج ف خدته في فاريبال وناديته

        final parentContext = context; // Save parent context

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Delete Note"),
            content: const Text(
              "Are you sure you want to delete this note?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  note.delete();

                  // ✅ Use parentContext here, NOT dialog context
                  BlocProvider.of<NotesCubit>(
                    parentContext,
                  ).fetchNotes();

                  Navigator.of(context).pop(); // Close dialog

                  showTopSnackBar(
                    Overlay.of(
                      parentContext,
                    ), // Use parent context here too
                    const CustomSnackBar.success(
                      message: "Note deleted successfully!",
                   
                    ),
                  );
                },
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}