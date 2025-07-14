// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utiles/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<Offset> _logoAnimation;
  late final Animation<Offset> _textAnimation;

  @override
  void initState() {
    super.initState();
    anitSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void anitSlidingAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _logoAnimation = Tween<Offset>(
      begin: const Offset(0, -3), // icon from top
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _textAnimation = Tween<Offset>(
      begin: const Offset(0, 3), // text from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 30), () {
      GoRouter.of(context).go(AppRouter.KNoteView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _logoAnimation,
              child: Image.asset(
                "assets/note_logo.png",
                height: 120,
                width: 120,
                fit: BoxFit.contain, // keeps aspect ratio, avoids stretching
              ),
            ),
            SlideTransition(
              position: _textAnimation,
              child: Column(
                children: const [
                  Text(
                    'Notesy',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Capture your thoughts instantly',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
