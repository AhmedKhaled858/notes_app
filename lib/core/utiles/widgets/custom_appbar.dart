import 'package:flutter/material.dart';
import 'package:note_app/core/utiles/widgets/custom_appbar_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.icon,
    this.iconButton,
    required this.onIconTap,
  });

  final String title;
  final IconData icon;
  final IconButton? iconButton;
  final void Function()? onIconTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
        child: Row(
          children: [
            if (iconButton != null) iconButton!, // ← Optional back button
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Spacer(),
            CustomAppBarIcon(icon: icon,
              onTap:onIconTap,
            ),
          ],
        ),
      ),
    );
  }
}
