import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/features/search/presentation/manger/cubits/cubit/search_cubit.dart';
import 'package:note_app/features/search/presentation/widgets/search_view_body.dart';
import '../../../core/utiles/constant.dart';
import '../../notes/data/models/note_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final notesBox = Hive.box<NoteModel>(kNotesBox);
    final allNotes = notesBox.values.toList();

    return BlocProvider(
      create: (context) => SearchCubit()..allNotes = allNotes,
      child: const Scaffold(body: SearchViewBody()),
    );
  }
}
