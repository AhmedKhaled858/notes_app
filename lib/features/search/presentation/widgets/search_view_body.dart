// search_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/utiles/constant.dart';
import 'package:note_app/features/notes/presentation/views/widgets/custom_text_field.dart';
import 'package:note_app/features/search/presentation/manger/cubits/cubit/search_cubit.dart';
import '../../../notes/data/models/note_model.dart';
import '../../../notes/presentation/views/widgets/note_item.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String? query) {
    context.read<SearchCubit>().searchNotes(query ?? '');
  }

  late SearchCubit myCubit;

@override
void didChangeDependencies() {
  super.didChangeDependencies();
  myCubit = context.read<SearchCubit>(); // ✅ safe here
}

@override
void dispose() {
  myCubit.clearSearch(); // ✅ use it here without context
  super.dispose();
}
@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _searchController,
                 // autofocus: false,
                  labelText: "Search",
                  hintText: "Search notes...",
                  onChanged: _onSearchChanged,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                    if (GoRouter.of(context).canPop()) {
                context.pop();
              } else {
                context.go('/notes');
              }
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: KPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // const Align(
          //   alignment: Alignment.centerLeft,
          //   child: Text("Result.."),
          // ),
          Expanded(
            child: BlocBuilder<SearchCubit, List<NoteModel>>(
              builder: (context, filteredNotes) {
                if (filteredNotes.isEmpty) {
                  return const Center(
                    child: Text(
                      'No notes found',
                      style: TextStyle(color: Colors.white54),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: filteredNotes.length,
                  itemBuilder: (context, index) {
                    return NoteItem(note: filteredNotes[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
}