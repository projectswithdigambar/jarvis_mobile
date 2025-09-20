import 'package:flutter/material.dart';
import 'package:glow_container/glow_container.dart';

class BottomNav extends StatelessWidget {
  final Function(bool) onMicClick;

  BottomNav({required this.onMicClick});

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      key: const ValueKey('mic'),
      glowRadius: 10,
      gradientColors: const [
        Colors.blueAccent,
        Colors.deepPurpleAccent,
        Colors.pinkAccent
      ],
      rotationDuration: const Duration(seconds: 3),
      glowLocation: GlowLocation.outerOnly,
      containerOptions: const ContainerOptions(
        width: 70,
        height: 70,
        borderRadius: 15,
        backgroundColor: Colors.black,
        borderSide: BorderSide(
          width: 0,
          color: Colors.black,
        ),
      ),
      transitionDuration: const Duration(milliseconds: 300),
      showAnimatedBorder: true,
      child: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.widgets_outlined),
                color: Colors.grey,
                iconSize: 24.0,
                onPressed: () {},
              ),
              Container(
                height: 90,
                width: 90,
                child: GestureDetector(
                  onTap: () {
                    onMicClick(true);
                  },
                  child: Image.asset(
                    'assets/gif/jarvis.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.keyboard_outlined),
                color: Colors.grey,
                iconSize: 24.0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
