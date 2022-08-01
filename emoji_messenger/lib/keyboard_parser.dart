import 'package:flutter/services.dart';
import 'dart:convert';

Future<Map<String, dynamic>> readJson() => rootBundle.loadString('assets/emoji_map.json').then((value) => json.decode(value));
