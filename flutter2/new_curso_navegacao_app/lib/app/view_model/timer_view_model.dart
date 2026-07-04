import 'dart:async';

import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier{
  bool isPlaying = false;
  int actualTimerInSeconds = Duration(minutes: 25).inSeconds;
  Timer? timer;

  void startTimer(int initialMinutes, ValueNotifier<bool> isRunning){
    if (actualTimerInSeconds == 0){
      actualTimerInSeconds = Duration(minutes: initialMinutes).inSeconds;
    }
    isPlaying = true;
    startTimerService(isRunning);
    isRunning.value = true;
    notifyListeners();
  }

  void startTimerService(ValueNotifier<bool> isRunning){
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      if (actualTimerInSeconds > 0){
        actualTimerInSeconds--;
        notifyListeners();
      } else {
        isPlaying = false;
        isRunning.value = false;
        notifyListeners();
        clearTimerService();
      }
    });
  }

  void clearTimerService(){
    if(timer != null){
      timer!.cancel();
      timer = null;
    }
  }

  void resetTimer(int initialMinutes, ValueNotifier<bool> isRunning){
    clearTimerService();
    isPlaying = false;
    actualTimerInSeconds = Duration(minutes: initialMinutes).inSeconds;
    isRunning.value = false;
    notifyListeners();
  }

  void continueTimer(ValueNotifier<bool> isRunning){
    isPlaying = true;
    startTimerService(isRunning);
    notifyListeners();
  }

  void pauseTimer(){
    isPlaying = false;
    notifyListeners();
    clearTimerService();
  }
}