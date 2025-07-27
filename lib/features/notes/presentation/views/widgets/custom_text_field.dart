// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,  this.labelText,  this.maxLines, this.hintText, this.onSaved, this.onChanged});
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
            onChanged:onChanged ,
            onSaved: onSaved,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $labelText';
              }
              return null;
            },
            maxLines:maxLines??1,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              labelStyle: TextStyle(color:KPrimaryColor),
              hintStyle: TextStyle(color:KPrimaryColor.withOpacity(0.5)),
              border: OutlineInputBorder(
             //   borderSide: const BorderSide(color: KPrimaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color:Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
               borderSide: const BorderSide(color:Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),  
            ),
          );
  }
}