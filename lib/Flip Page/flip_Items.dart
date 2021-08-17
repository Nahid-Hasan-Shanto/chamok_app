import 'package:a_kids/Flip%20Page/flip_page.dart';
import 'package:a_kids/Models/dummy.dart';
import 'package:a_kids/Models/items.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';
import 'package:text_to_speech/text_to_speech.dart';

class FlipItems extends StatefulWidget {
  final String eventType;
  FlipItems({required this.eventType});

  @override
  _FlipItemsState createState() => _FlipItemsState();
}

class _FlipItemsState extends State<FlipItems> {
  List<Item> item = Dummy.category;
  int currentIndex = 0;
  TextToSpeech tts = TextToSpeech();
  double volume = 1.0;
  var direction = FlipDirection.HORIZONTAL;

  @override
  void didUpdateWidget(covariant FlipItems oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.eventType == 'increment') {
      onIncrement();
    } else if (widget.eventType == 'decriment') {
      onDecrement();
    } else {
      onInit();
    }
    //print(widget.eventType);
  }

  onIncrement() {
    setState(() {
      currentIndex = item.length - 1 == currentIndex ? 0 : currentIndex + 1;
      tts.speak(item[currentIndex].frontText);
    });
  }

  onDecrement() {
    setState(() {
      currentIndex = currentIndex == 0 ? (item.length - 1) : currentIndex - 1;
      tts.speak(item[currentIndex].frontText);
    });
  }

  onInit() {
    setState(() {
      currentIndex = 0;
      tts.speak(item[currentIndex].frontText);
    });
  }

  @override
  Widget build(BuildContext context) {
    Item currentItem = item[currentIndex];
    tts.setVolume(volume);
    return Container(
      child: Swipe(
        child: FlipPage(
            frontText: currentItem.frontText,
            frontTitle: currentItem.frontTitle,
            backimage: currentItem.backimage,
            backText: currentItem.backText,
            direction: (currentIndex % 2 == 0)
                ? FlipDirection.HORIZONTAL
                : FlipDirection.VERTICAL),
        onSwipeLeft: () {
          onIncrement();
        },
        onSwipeRight: () {
          onDecrement();
        },
        onSwipeUp: () {
          onIncrement();
        },
        onSwipeDown: () {
          onDecrement();
        },
        verticalMaxWidthThreshold: 250,
        verticalMinDisplacement: 100,
        verticalMinVelocity: 300,
        horizontalMaxHeightThreshold: 250,
        horizontalMinDisplacement: 100,
        horizontalMinVelocity: 300,
      ),
    );
  }
}
