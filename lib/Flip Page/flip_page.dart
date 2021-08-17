import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class FlipPage extends StatelessWidget {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  Color bdColro = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  Color fbdColro = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final FlipDirection direction;
  final String frontText;
  final String frontTitle;
  final String backimage;
  final String backText;
  TextToSpeech tts = TextToSpeech();
  double volume = 1.0;
  double rate = 0.6;
  double pitch = 1.0;

  FlipPage(
      {required this.frontText,
      required this.frontTitle,
      required this.backimage,
      required this.backText,
      required this.direction});

  @override
  Widget build(BuildContext context) {
    tts.setRate(rate);
    tts.setPitch(pitch);
    tts.setVolume(volume);
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(
        right: 38,
        top: 96,
        left: 38,
        bottom: 96,
      ),
      child: FlipCard(
        key: cardKey,
        direction: direction,
        speed: 500,
        onFlipDone: (status) {
          if (status) {
            tts.speak(frontText);
          } else {
            tts.speak('$frontText for $backText');
          }
          //print(status);
        },
        front: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: bdColro, borderRadius: BorderRadius.circular(8.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  frontText,
                  style: TextStyle(
                      fontSize: 300.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Icon(
                Icons.touch_app_sharp,
                color: Colors.white,
                size: 60,
              ),
            ],
          ),
        ),
        back: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: fbdColro,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Image.network(backimage)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  backText,
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
