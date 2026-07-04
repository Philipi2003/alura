import 'package:flutter/material.dart';
import 'package:new_curso_navegacao_app/app/shared/utils/app_config.dart';
import 'package:new_curso_navegacao_app/app/view_model/timer_view_model.dart';

class TimerWidget extends StatefulWidget {
  final int initialMinutes;

  const TimerWidget({super.key, required this.initialMinutes});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  TimerViewModel timerViewModel = TimerViewModel();
  ValueNotifier<bool> isRunning = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    timerViewModel.actualTimerInSeconds = Duration(minutes: widget.initialMinutes).inSeconds;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (timerViewModel.timer != null){
      timerViewModel.clearTimerService();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(20, 68, 128, 0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xff144480), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Timer
          AnimatedBuilder(
            animation: timerViewModel,
            builder: (context, child) {
              return Text(
                "${Duration(seconds: timerViewModel.actualTimerInSeconds).inMinutes.toString().padLeft(2,'0')}:${(timerViewModel.actualTimerInSeconds%60).toString().padLeft(2,'0')}",
                style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'monospace',
                ),
              );
            },
          ),
          const SizedBox(height: 40),

          // Botões de controle
          // start/stop buttons
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ListenableBuilder(
              listenable: timerViewModel,
              builder: (context, child) {
                return ElevatedButton(
                  onPressed: () {
                    isRunning.value ? timerViewModel.resetTimer(widget.initialMinutes, isRunning) : timerViewModel.startTimer(widget.initialMinutes, isRunning);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isRunning.value ? Colors.red : Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(isRunning.value ? Icons.stop : Icons.play_arrow, color: AppConfig.backgroundColor),
                      const SizedBox(width: 10),
                      Text(
                        isRunning.value ? "Parar" : "Iniciar",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppConfig.backgroundColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // pause/continue buttons
          ListenableBuilder(
            listenable: isRunning,
            builder: (context, child) {
              if (isRunning.value == false){
                return SizedBox.shrink();
              }
              return SizedBox(
                width: double.infinity,
                height: 56,
                child: ListenableBuilder(
                  listenable: timerViewModel,
                  builder: (context, child) {
                    return ElevatedButton(
                      onPressed: () {
                        timerViewModel.isPlaying ? timerViewModel.pauseTimer() : timerViewModel.continueTimer(isRunning);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: timerViewModel.isPlaying ? Colors.white : AppConfig.buttonColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(timerViewModel.isPlaying ? Icons.pause : Icons.play_arrow_outlined, color: AppConfig.backgroundColor),
                          const SizedBox(width: 10),
                          Text(
                            timerViewModel.isPlaying ? "Pausar" : "Continuar",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppConfig.backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
