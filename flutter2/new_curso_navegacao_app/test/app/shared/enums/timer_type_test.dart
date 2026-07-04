import 'package:flutter_test/flutter_test.dart';
import 'package:new_curso_navegacao_app/app/shared/enums/timer_type.dart';

void main(){

  group('Valida TimerType', (){
    test("validando o número de valores, se é igual a três possíveis valores", (){
      expect(TimerType.values.length, 3);
    });

    test("Valor focus existe e corresponde ao esperado", (){
      expect(TimerType.focus.title, 'Modo Foco');
      expect(TimerType.focus.minutes, 25);
      expect(TimerType.focus.imageName, 'assets/focus.png');
    });

    test("Valor shortBreak existe e corresponde ao esperado", (){
      expect(TimerType.shortBreak.title, 'Pausa Curta');
      expect(TimerType.shortBreak.minutes, 5);
      expect(TimerType.shortBreak.imageName, 'assets/pause.png');
    });

    test("Valor longBreak existe e corresponde ao esperado", (){
      expect(TimerType.longBreak.title, 'Pausa Longa');
      expect(TimerType.longBreak.minutes, 15);
      expect(TimerType.longBreak.imageName, 'assets/long.png');
    });
  });

}