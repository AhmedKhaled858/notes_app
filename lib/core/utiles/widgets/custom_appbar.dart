import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/widgets/custom_appbar_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title, required this.icon});
  final String title ;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        child: Row(
          children: [
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          Spacer(),
          //IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 30)),
          CustomAppBarIcon(icon: icon),
        ],),
      ),
    );
  }
}