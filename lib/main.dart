import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/app_router.dart';

void main() {
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

