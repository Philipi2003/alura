import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_curso_navegacao_app/app/view_model/timer_view_model.dart';

void main() async {

  group("Testa o view model TimerViewModel", (){
    late TimerViewModel timerViewModel;
    late ValueNotifier<bool> isRunning = ValueNotifier(false);

    setUp((){
      timerViewModel = TimerViewModel();
      timerViewModel.actualTimerInSeconds = Duration(minutes: 5).inSeconds;
      isRunning.value = false;
    });

    test("O valor de actualTimerInSeconds é o total do tempo informado no start além de estar rodando o timer", () async {
      timerViewModel.startTimer(5, isRunning);
      // await Future.delayed(Duration(seconds: 0));
      expect(timerViewModel.actualTimerInSeconds, Duration(minutes: 5).inSeconds);
      expect(timerViewModel.isPlaying, true);
    });

    test("Verica se o decrescimo está funcionando", () async {
      timerViewModel.startTimer(5, isRunning);
      await Future.delayed(Duration(seconds: 5));
      expect(timerViewModel.actualTimerInSeconds, Duration(minutes: 5).inSeconds - 4);
      expect(timerViewModel.isPlaying, true);
    });

    test("Verica se o pause está funcionando", () async {
      timerViewModel.startTimer(5, isRunning);
      await Future.delayed(Duration(seconds: 2));
      timerViewModel.pauseTimer();
      await Future.delayed(Duration(seconds: 3));
      expect(timerViewModel.actualTimerInSeconds, Duration(minutes: 5).inSeconds - 1);
      expect(timerViewModel.isPlaying, false);
    });

    test("Verica se o pause e resume está funcionando", () async {
      timerViewModel.startTimer(5, isRunning);
      await Future.delayed(Duration(seconds: 2));
      timerViewModel.pauseTimer();
      await Future.delayed(Duration(seconds: 2));
      timerViewModel.continueTimer(isRunning);
      await Future.delayed(Duration(seconds: 1));
      expect(timerViewModel.actualTimerInSeconds, Duration(minutes: 5).inSeconds - 2);
      expect(timerViewModel.isPlaying, true);
    });
  });

}