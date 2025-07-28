// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/utiles/constant.dart';
import '../../../../../data/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<List<NoteModel>> {
  NotesCubit() : super([]);

  final notesBox = Hive.box<NoteModel>(kNotesBox);
  List<NoteModel> allNotes = [];

  void fetchNotes() {
    allNotes = notesBox.values.toList();
    emit(allNotes);
  }

}
