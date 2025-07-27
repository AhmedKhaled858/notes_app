import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/utiles/widgets/custom_appbar.dart';
import 'package:note_app/features/notes/presentation/views/widgets/notes_listview.dart';

import '../../manger/cubits/notes_cubit/cubit/notes_cubit.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
         CustomAppbar(
          onIconTap: (){},
          title: "Notes", icon: Icons.search),
        Expanded(
          child:const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: NotesListview(),
          ),
        ),
      ],),
    );
  }
}