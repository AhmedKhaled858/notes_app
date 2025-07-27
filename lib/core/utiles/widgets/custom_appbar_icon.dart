import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  final IconData icon; // 👈 Add this line
  final void Function()? onTap; // 👈 Add this line
  const CustomAppBarIcon({
    super.key,
    required this.icon, // 👈 Require the icon
    required this.onTap, // 👈 Require the onTap callback
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(13),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
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
          child: Center(
            child: Icon(
              icon, // 👈 Use the passed icon here
              size: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
