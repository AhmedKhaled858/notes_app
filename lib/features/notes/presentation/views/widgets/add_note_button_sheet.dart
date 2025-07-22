// ignore_for_file: must_be_immutable, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'add_note_form.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 25,
        top: 25,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:  AddNoteForm(),
      ),
    );
  }
}
