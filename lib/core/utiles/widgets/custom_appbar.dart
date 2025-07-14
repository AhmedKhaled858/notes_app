import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/widgets/custom_search_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('Notes', style: Theme.of(context).textTheme.headlineLarge),
      Spacer(),
      //IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 30)),
      CustomSearchIcon(),
    ],);
  }
}