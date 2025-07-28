import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/utiles/constant.dart';
import '../../../../../notes/data/models/note_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<List<NoteModel>> {
  SearchCubit() : super([]);

    final notesBox = Hive.box<NoteModel>(kNotesBox);
  List<NoteModel> allNotes = [];  
  void searchNotes(String query) {
    if (query.isEmpty) {
      emit([]); // Return empty list when query is cleared
    } else {
      final filtered = allNotes.where((note) {
        final titleMatch = note.title.toLowerCase().contains(query.toLowerCase());
        final subtitleMatch = note.subtitle.toLowerCase().contains(query.toLowerCase());
        return titleMatch || subtitleMatch;
      }).toList();
      emit(filtered);
    }
  }

  void clearSearch() {
    emit([]); // Do not show all notes until user exits search mode
  }
}
