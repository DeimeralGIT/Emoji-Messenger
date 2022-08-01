import 'package:emoji_messenger/keyToEmoji.dart';
import 'package:emoji_messenger/keyboard_parser.dart';
import 'package:emoji_messenger/main.dart';
import 'package:flutter/material.dart';

class SoftKeyboard extends StatefulWidget {
  List<Widget> emojis = [];

  SoftKeyboard() : super(key: softKeyboardKey);
  @override
  State<StatefulWidget> createState() => SoftKeyboardState();
}

class SoftKeyboardState extends State<SoftKeyboard> {
  @override
  void initState() {
    readJson().then(((emojiList) {
      List<Widget> oneRow = [];
      for (int i = 0; i < emojiList.length; i++) {
        oneRow.add(KeyToEmoji(name: emojiList.keys.elementAt(i), onPressed: onEmojiPressed));
        if ((i + 1) % 9 == 0) {
          widget.emojis.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: oneRow));
          oneRow = [];
        } else if (i == emojiList.length - 1) {
          widget.emojis.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: oneRow));
        }
      }
      setState(() {});
    }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      child: Container(
        height: isKeyboardExpanded ? screenHeight / 3 : 0,
        padding: const EdgeInsets.all(7),
        width: screenWidth,
        color: Colors.blue,
        alignment: Alignment.topCenter,
        child: ListView(
          children: widget.emojis,
        ),
      ),
    );
  }
}
