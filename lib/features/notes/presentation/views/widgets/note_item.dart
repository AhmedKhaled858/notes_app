// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/utiles/app_router.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../manger/cubits/notes_cubit/cubit/notes_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go(AppRouter.KEditNoteView,  extra: note,);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          elevation: 5,
          color: const Color.fromARGB(
            236,
            255,
            255,
            255,
          ).withOpacity(0.2), // transparent card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              bottom: 20,
              right: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.title,
                            style: TextStyle(
                              // color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            note.subtitle,
                            maxLines: 2,
                            style: TextStyle(
                              // color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
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
                                        backgroundColor: Color.fromARGB(255, 13, 243, 16),
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
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0, top: 16),
                  child: Text(
                    note.date,
                    style: TextStyle(
                      //   color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
