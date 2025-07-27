import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_text_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../../core/utiles/widgets/custom_appbar.dart';
import '../../manger/cubits/notes_cubit/cubit/notes_cubit.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? title, content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppbar(
            onIconTap: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchNotes();
                showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                message: "Note Edited successfully!",
              ),
              
            );
                if (GoRouter.of(context).canPop()) {
                context.pop();
              } else {
                context.go('/notes');
              }
            },
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
              children:  [
                CustomTextField(
                  onChanged: (value){
                    title = value;
                  },
                 // labelText: "title",
                  hintText: widget.note.title,
                ),
                SizedBox(height: 25),
                CustomTextField(
                  onChanged: (value){
                    content = value;
                  },
                  //labelText: "content",
                  hintText: widget.note.subtitle,
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
