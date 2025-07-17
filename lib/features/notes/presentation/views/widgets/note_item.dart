// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/core/utiles/app_router.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).go(AppRouter.KEditNoteView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          elevation: 5,
          color: const Color.fromARGB(236, 255, 255, 255).withOpacity(0.2), // transparent card
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, bottom: 20,right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Flutter Note",
                            style: TextStyle(
                             // color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "build your first flutter app, using flutter and dart",
                            maxLines: 2,
                            style: TextStyle(
                             // color: Colors.black54,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.delete, color: Colors.white,size: 24,),
                        onPressed: () {
                          // Handle delete
                        },
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0,top: 16),
                  child: Text(
                    "May 2022",
                    style: TextStyle(
                   //   color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
