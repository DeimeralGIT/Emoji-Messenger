import 'package:flutter/services.dart';
import 'dart:convert';

Future<Map<String, String>> readJson() => rootBundle
    .loadString('assets/emoji_map.json')
    .then((value) => json.decode(value));
