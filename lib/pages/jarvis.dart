import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jarvis/controller/speech_controller.dart';
import 'package:jarvis/controller/waveform_controller.dart';
import 'package:jarvis/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Jarvis extends StatefulWidget {
  const Jarvis({super.key});

  @override
  State<Jarvis> createState() => _JarvisState();
}

class _JarvisState extends State<Jarvis> {
  bool isBlob = true;
  bool isBottomMic = false;

  @override
  Widget build(BuildContext context) {
    final speechController = Provider.of<SpeechController>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 42),
      body: SafeArea(
        child: isBlob
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
                                    isBlob = false;
                                    isBottomMic = true;
                                  }),
                                  speechController.isListening
                                      ? speechController.stopListening()
                                      : speechController.startListening()
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
      bottomNavigationBar: !isBlob
          ? Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: isBottomMic
                  ? BottomAppBar(
                      height: 250,
                      color: Colors.transparent,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 20),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    speechController.lastWords,
                                    style: GoogleFonts.roboto(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: 100,
                                child: SiriWaveform.ios9(
                                  controller: WaveformController().controller,
                                  options: const IOS9SiriWaveformOptions(
                                      height: 100, width: 400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BottomNav(
                        onMicClick: (isClick) => {
                          if (isClick)
                            {
                              setState(() {
                                isBottomMic = true;
                                speechController.startListening();
                              })
                            }
                        },
                      )),
            )
          : null,
    );
  }
}
