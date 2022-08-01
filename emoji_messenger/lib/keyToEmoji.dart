import 'package:emoji_messenger/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget KeyToEmoji({required String name, bool isExpanded = false, Function(String)? onPressed}) {
  return GestureDetector(
    onTap: onPressed != null ? () => onPressed(name) : null,
    child: SvgPicture.asset(
      "assets/emojis/$name.svg",
      height: !isExpanded ? textEmojiSide : null,
      width: !isExpanded ? textEmojiSide : null,
    ),
  );
}
