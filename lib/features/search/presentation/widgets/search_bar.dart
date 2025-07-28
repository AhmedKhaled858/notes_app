
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utiles/constant.dart';
import '../../../notes/presentation/views/widgets/custom_text_field.dart';
import '../manger/cubits/cubit/search_cubit.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}


class _SearchAppBarState extends State<SearchAppBar> {
   final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String? query) {
    context.read<SearchCubit>().searchNotes(query ?? '');
  }
  @override
  Widget build(BuildContext context) {
    
    return  Row(
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
          );
  }
}