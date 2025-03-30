import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends ChangeNotifier {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  // Getter Methods

  bool get speechEnabled => _speechEnabled;
  String get lastWords => _lastWords;
  bool get isListening => _speechToText.isListening;

  SpeechController() {
    _initSpeech();
  }

  Future _initSpeech() async {
    try {
      _speechEnabled = await _speechToText.initialize();
    } catch (e) {
      print("Error in intialization $e");
    }

    notifyListeners();
  }

  // Start Method
  void startListening() async {
    await _speechToText.listen(onResult: (result) {
      _lastWords = result.recognizedWords;
      notifyListeners();
    });
  }

  // Stop Method
  void stopListening() async {
    await _speechToText.stop();
    notifyListeners();
  }
}
