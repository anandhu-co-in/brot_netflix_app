import 'package:flutter/foundation.dart';
import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    print("reset");
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

// FROM https://stackoverflow.com/questions/51791501/how-to-debounce-textfield-onchange-in-dart#comment112862877_52930197
