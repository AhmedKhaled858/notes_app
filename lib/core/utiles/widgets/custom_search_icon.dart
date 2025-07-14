// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(13),
      elevation: 6, // optional: Material elevation for shadow
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: () {
          // Do your search logic here
          print("Search icon clicked");
        },
        child: Container(
          height: 46,
          width: 45,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.search,
              size: 28,
              color: Colors.white, // icon color
            ),
          ),
        ),
      ),
    );
  }
}
