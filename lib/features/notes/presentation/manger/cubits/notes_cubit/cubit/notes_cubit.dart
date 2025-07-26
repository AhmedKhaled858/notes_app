// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/utiles/constant.dart';
import '../../../../../data/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());
  List<NoteModel>? notes;
  void fetchNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }

  // ✅ Getter to get the current number of notes
  int get notesCount {
    if (state is NotesSuccess) {
      return (state as NotesSuccess).notes.length;
    }
    return 0;
  }

  // ✅ Optional: Getter to return notes directly
  // List<NoteModel> get notes {
  //   if (state is NotesSuccess) {
  //     return (state as NotesSuccess).notes;
  //   }
  //   return [];
  // }
}
