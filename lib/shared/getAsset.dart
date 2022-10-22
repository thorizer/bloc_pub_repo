import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Widget> getDevIcon(String path) async {
  try {
    await rootBundle.load(path);
    return Image.asset(path);
  } catch (_) {
    return SizedBox.shrink();
  }
}
