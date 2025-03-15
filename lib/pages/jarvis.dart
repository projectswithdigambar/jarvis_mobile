import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Jarvis extends StatelessWidget {
  const Jarvis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 42),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Hi 👋, Digambar",
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "How can i help you",
                style: TextStyle(color: Colors.cyan, fontSize: 24),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/gif/jarvis.gif'),
              TextAnimatorSequence(loop: true, children: [
                TextAnimator(
                  "J . A . R . V . I . S",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                  atRestEffect: WidgetRestingEffects.pulse(),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
