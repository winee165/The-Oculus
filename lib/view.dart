import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class XScreen extends StatefulWidget {
  @override
  State<XScreen> createState() => _XScreenState();
}

class _XScreenState extends State<XScreen> {
  String data = '';
  final FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    _speak(String msg, String language) async {
      await flutterTts.setLanguage(language);
      await flutterTts.setPitch(1);
      await flutterTts.speak(msg);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.5),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  hintText: "Enter Text to be converted",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                onChanged: (value) {
                  data = value;
                  _speak(data, "en-US");
                }),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _speak(data, "en-US");
            },
            child: const Text("convert"),
          ),
        ],
      ),
    );
  }
}