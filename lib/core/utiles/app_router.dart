// ignore_for_file: constant_identifier_names

import 'package:go_router/go_router.dart';
import 'package:note_app/features/notes/presentation/views/edit_note_view.dart';
import 'package:note_app/features/notes/presentation/views/notes_view.dart';

import '../../features/notes/data/models/note_model.dart';
import '../../features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const KSplashView = '/';
  static const KNoteView = '/notes';
  static const KEditNoteView = '/editnote';

  static final router = GoRouter(
    initialLocation: KSplashView,
    routes: [
      GoRoute(
        path: KSplashView,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: KNoteView,
        builder: (context, state) {
          return const NotesView();
        },
      ),
      GoRoute(
        path: KEditNoteView,
        builder: (context, state) {
          return EditNoteView(
            note: state.extra as NoteModel,
          );
        },
      ),
    ],
  );
}