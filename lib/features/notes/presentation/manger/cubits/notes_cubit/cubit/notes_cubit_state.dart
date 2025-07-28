part of 'notes_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}
final class NotesLoading extends NotesCubitState {}
final class NotesSuccess extends NotesCubitState {
  NotesSuccess(List<NoteModel> filtered);
  
}
final class NotesFailure extends NotesCubitState {
  final String errorMessage;

  NotesFailure(this.errorMessage);
} 