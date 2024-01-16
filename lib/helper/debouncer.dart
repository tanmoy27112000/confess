import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Debouncer({
    this.duration,
  });

  final Duration? duration;

  Timer? _timer;

  void run(VoidCallback action) {
    cancel();
    _timer = Timer(
      duration ?? const Duration(milliseconds: 750),
      action,
    );
  }

  void cancel() {
    _timer?.cancel();
  }
}
