// ignore_for_file: must_be_immutable, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/presentation/manger/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../manger/cubits/add_note_cubit/add_note_cubit.dart';
import 'add_note_form.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchNotes();
            Navigator.pop(context);
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                message: "Note created successfully!",
              ),
            );
          } else if (state is AddNoteFailure) {
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message: 'Failed to add note: ${state.errorMessage}',
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AbsorbPointer(
              absorbing: state is AddNoteLoading? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 25,
                      top: 25,
                    ),
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
