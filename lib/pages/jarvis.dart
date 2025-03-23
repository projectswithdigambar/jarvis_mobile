import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jarvis/controller/waveform_controller.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Jarvis extends StatefulWidget {
  const Jarvis({super.key});

  @override
  State<Jarvis> createState() => _JarvisState();
}

class _JarvisState extends State<Jarvis> {
  bool isBloob = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 42),
      body: SafeArea(
        child: isBloob
            ? Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Hi 👋, Digambar",
                      style: GoogleFonts.shareTech(
                          textStyle: const TextStyle(
                        color: Colors.cyan,
                        letterSpacing: .5,
                        fontSize: 16,
                      )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "How can i help you",
                      style: GoogleFonts.rajdhani(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ClipRect(
                        child: GestureDetector(
                            onTap: () => {
                                  setState(() {
                                    isBloob = false;
                                  }),
                                },
                            child: Image.asset('assets/gif/jarvis.gif'))),
                    TextAnimatorSequence(loop: true, children: [
                      TextAnimator(
                        "J . A . R . V . I . S",
                        style: GoogleFonts.comfortaa(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                        atRestEffect: WidgetRestingEffects.pulse(),
                      )
                    ])
                  ],
                ),
              )
            : Center(
                child: Text("Hello world"),
              ),
      ),
      bottomNavigationBar: !isBloob
          ? Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: BottomAppBar(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SiriWaveform.ios9(
                    controller: WaveformController().controller,
                    options:
                        const IOS9SiriWaveformOptions(height: 300, width: 400),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
