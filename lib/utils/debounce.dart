import 'dart:async';
import 'package:flutter/material.dart';

class Debounce {
  const Debounce(this.duration);

  final Duration duration;
  static Timer? _timer;

  void run(VoidCallback callback){
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }

  void cancel(){
    _timer?.cancel();
  }
}