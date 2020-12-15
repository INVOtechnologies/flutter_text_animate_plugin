import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextAnimate extends StatefulWidget {
  final List<String> text;
  final double pauseDuration;
  final double speed;
  _TextAnimate({this.text, this.pauseDuration = 2000, this.speed = 500});

  @override
  _TextAnimate createState() => _TextAnimate();
}

class _TextAnimate extends State<TextAnimate> {
  String parsedText = "";
  int currentLetter = 0;
  int currentPart = 0;
  int duration = 0;
  bool reverse = false;
  @override
  void initState() {
    changeLetter();
    super.initState();
  }

  void changeLetter() {
    double duration = widget.speed;
    if (reverse) {
      currentLetter = currentLetter <= 0 ? 0 : currentLetter - 1;
    } else {
      currentLetter = currentLetter >= widget.text[currentPart].length
          ? 0
          : currentLetter + 1;
    }

    if (reverse && currentLetter == 0) {
      currentPart = currentPart == widget.text.length - 1 ? 0 : currentPart + 1;
    }
    if (currentLetter == widget.text[currentPart].length) {
      duration = widget.pauseDuration;
      reverse = true;
    } else if (currentLetter == 0) {
      duration = 0;
      reverse = false;
    }
    duration = currentLetter < widget.text[currentPart].length && reverse
        ? widget.speed / 2
        : duration;
    setState(() {});
    Future.delayed(Duration(milliseconds: (duration).toInt()), () {
      print("setStateTime");
      changeLetter();
    });
  }

  @override
  Widget build(BuildContext context) {
    String result = widget.text[currentPart].substring(0, currentLetter);
    return Text(result, style: TextStyle(fontSize: 28));
  }
}
