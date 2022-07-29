import 'package:emoji_messenger/keyToEmoji.dart';
import 'package:emoji_messenger/main.dart';
import 'package:flutter/material.dart';

class SoftKeyboard extends StatefulWidget {
  List<Widget> emojis = [];

  SoftKeyboard() : super(key: softKeyboardKey) {
    List<Widget> oneRow = [];
    for (int i = 0; i < emojiList.length; i++) {
      oneRow.add(KeyToEmoji(name: emojiList.keys.elementAt(i)));
      if (i % 8 == 0 && i != 0) {
        emojis.add(Row(children: oneRow));
        oneRow = [];
      }
    }
  }
  @override
  State<StatefulWidget> createState() => SoftKeyboardState();
}

class SoftKeyboardState extends State<SoftKeyboard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      child: Container(
        height: isKeyboardExpanded ? screenHeight / 3 : 0,
        padding: const EdgeInsets.all(7),
        width: screenWidth,
        color: Colors.blue,
        child: ListView(
          children: widget.emojis,
        ),
      ),
    );
  }
}
