import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/notes/data/models/note_model.dart';
import 'package:note_app/features/notes/presentation/manger/cubits/notes_cubit/cubit/notes_cubit.dart';
import 'note_item.dart';

class NotesListview extends StatelessWidget {
  const NotesListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          // child: ListView.builder(
          //   itemCount: notes.length,
          //   itemBuilder: (context,index){
          //  return Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: NoteItem(),
          //   );
          // })
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: notes.length,
                  (context, index) => NoteItem(note: notes[index]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
