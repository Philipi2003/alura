import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_curso_navegacao_app/app/view/pages/timer_page.dart';
import 'package:new_curso_navegacao_app/app/view_model/timer_view_model.dart';
import 'package:new_curso_navegacao_app/app/shared/enums/timer_type.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

class MockTimerViewModel extends Mock implements TimerViewModel{

}

void main(){
  late MockTimerViewModel mockTimerViewModel;

  setUpAll((){
    registerFallbackValue(ValueNotifier<bool>(false));
  });

  setUp((){
    mockTimerViewModel = MockTimerViewModel();

    when(() => mockTimerViewModel.actualTimerInSeconds).thenReturn(60);
    when(() => mockTimerViewModel.isPlaying).thenReturn(false);
  });

  Widget createWidget({
    TimerType timerType = TimerType.focus
  }){
    return ChangeNotifierProvider<TimerViewModel>.value(
      value: mockTimerViewModel,
      child: MaterialApp(home: Scaffold(body: TimerPage(timerType: timerType),),));
  }

  group('TimerPage UI - ', (){
    group('TimerType = focus', (){
      testWidgets('Deve exibir o tempo inicial formatado corretamente e o botão iniciar', (tester) async {
        await tester.pumpWidget(createWidget());

        expect(find.text('25:00'), findsOneWidget);
        expect(find.text('Iniciar'), findsOneWidget);
      });

      testWidgets('deve chamar startTimer ao clicar em iniciar', (tester) async {
        await tester.pumpWidget(createWidget());

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        verify(()=> mockTimerViewModel.startTimer(25, any())).called(1);
      });

      testWidgets('mostrar "Pausar" após iniciar o contagem', (tester) async {
        await tester.pumpWidget(createWidget());

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Pausar'), findsOneWidget);
          expect(find.text('Iniciar'), findsNothing);
        });
      });

      testWidgets('mostrar "Continuar" após pausar a contagem', (tester) async {
        await tester.pumpWidget(createWidget());

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          await tester.tap(find.text('Pausar'));
          await tester.pumpAndSettle();
          expect(find.text('Continuar'), findsOneWidget);
        });
      });

      testWidgets('mostrar "Continuar" após pausar a contagem', (tester) async {
        await tester.pumpWidget(createWidget());

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Parar'), findsOneWidget);
          await tester.tap(find.text('Parar'));
          await tester.pumpAndSettle();
          verify(() => mockTimerViewModel.resetTimer(any(), any())).called(1);
        });
      });

    });

    group('TimerType = longBreak', (){
      testWidgets('Deve exibir o tempo inicial formatado corretamente e o botão iniciar', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        expect(find.text('15:00'), findsOneWidget);
        expect(find.text('Iniciar'), findsOneWidget);
      });

      testWidgets('deve chamar startTimer ao clicar em iniciar', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        verify(()=> mockTimerViewModel.startTimer(15, any())).called(1);
      });

      testWidgets('mostrar "Pausar" após iniciar o contagem', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Pausar'), findsOneWidget);
          expect(find.text('Iniciar'), findsNothing);
        });
      });

      testWidgets('mostrar "Continuar" após pausar a contagem', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          await tester.tap(find.text('Pausar'));
          await tester.pumpAndSettle();
          expect(find.text('Continuar'), findsOneWidget);
        });
      });

      testWidgets('mostrar "Continuar" após pausar a contagem', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.longBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Parar'), findsOneWidget);
          await tester.tap(find.text('Parar'));
          await tester.pumpAndSettle();
          verify(() => mockTimerViewModel.resetTimer(any(), any())).called(1);
        });
      });

    });

    group('TimerType = shortBreak', (){
      testWidgets('Deve exibir o tempo inicial formatado corretamente e o botão iniciar', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        expect(find.text('5:00'), findsOneWidget);
        expect(find.text('Iniciar'), findsOneWidget);
      });

      testWidgets('deve chamar startTimer ao clicar em iniciar', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        verify(()=> mockTimerViewModel.startTimer(5, any())).called(1);
      });

      testWidgets('mostrar "Pausar" após iniciar o contagem', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Pausar'), findsOneWidget);
          expect(find.text('Iniciar'), findsNothing);
        });
      });

      testWidgets('mostrar "Continuar" após pausar a contagem', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          await tester.tap(find.text('Pausar'));
          await tester.pumpAndSettle();
          expect(find.text('Continuar'), findsOneWidget);
        });
      });

      testWidgets('mostrar "Continuar" após pausar a contagem', (tester) async {
        await tester.pumpWidget(createWidget(timerType: TimerType.shortBreak));

        await tester.tap(find.text('Iniciar'));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Parar'), findsOneWidget);
          await tester.tap(find.text('Parar'));
          await tester.pumpAndSettle();
          verify(() => mockTimerViewModel.resetTimer(any(), any())).called(1);
        });
      });

    });

  });
}