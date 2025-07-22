// ignore_for_file: must_be_immutable, use_build_context_synchronously, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_add_button.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_text_field.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

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
class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();

}

class _AddNoteFormState extends State<AddNoteForm> {
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String?title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
            children: [
              CustomTextField(
                onSaved: (value){
                  title = value;
                },
                labelText: "title",
                hintText: "write your title here",
              ),
             const SizedBox(height: 25),
              CustomTextField(
                maxLines: 5,
                labelText: "content",
                hintText: "write your note here",
                onSaved: (value){
                  subtitle = value;
                },
              ),
             const SizedBox(height: 60),
            CustomAddButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // ✅ Show top success message
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.success(
                        message: "Note created successfully!",
                      ),
                    );

                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.pop(context);
                    });
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
    );
  }
}