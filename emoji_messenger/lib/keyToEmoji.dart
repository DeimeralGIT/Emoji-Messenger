import 'package:emoji_messenger/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget KeyToEmoji(String name) {
  return SvgPicture.asset(
    "assets/emojis/$name.svg",
    height: textEmojiSide,
    width: textEmojiSide,
  );
}
