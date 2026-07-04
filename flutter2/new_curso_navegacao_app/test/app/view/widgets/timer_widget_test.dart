import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:new_curso_navegacao_app/app/view/widgets/timer_widget.dart';
import 'package:new_curso_navegacao_app/app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';

class MockTimerViewModel extends Mock implements TimerViewModel{

}

void main(){
  group('Testa timer_widget', (){

    late MockTimerViewModel mockTimerViewModel;

    Widget createWidget(){
      return ChangeNotifierProvider<TimerViewModel>.value(
        value: mockTimerViewModel,
        child: MaterialApp(home: Scaffold(body: TimerWidget(initialMinutes: 1),),));
    }

    setUpAll((){
      registerFallbackValue(ValueNotifier<bool>(true));
    });

    setUp((){
      mockTimerViewModel = MockTimerViewModel();

      when(() => mockTimerViewModel.actualTimerInSeconds).thenReturn(60);
      when(() => mockTimerViewModel.isPlaying).thenReturn(false);
    });

    testWidgets('Testa se o timer começa com valor cheio', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.text('01:00'), findsOneWidget);
    });

    testWidgets('ao tocar em Iniciar, chama startTimer do TimerViewModel', (tester) async {
      await tester.pumpWidget(createWidget());

      final startButton = find.text('Iniciar');
      expect(startButton, findsOneWidget);

      await tester.tap(startButton);
      await tester.pumpAndSettle();
      verify(() => mockTimerViewModel.startTimer(any(), any())).called(1);
    });

    testWidgets('pausa a contagem ao clicar em pausar', (tester) async {
      await tester.pumpWidget(createWidget());

      final startButton = find.text('Iniciar');
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      tester.runAsync(() async {
        final pauseButton = find.text('Pausar');
        expect(pauseButton, findsOneWidget);
        await tester.tap(pauseButton);
        await tester.pumpAndSettle(Duration(seconds: 2));

        expect(find.text("00:59"), findsOneWidget);
      });
    });

    testWidgets('chama stopTime ao clicar em Parar', (tester) async{
      await tester.pumpWidget(createWidget());

      final startButton = find.text('Iniciar');
      await tester.tap(startButton);
      await tester.pumpAndSettle();

      tester.runAsync(() async {
        final pauseButton = find.text('Pausar');
        expect(pauseButton, findsOneWidget);
        await tester.tap(pauseButton);
        await tester.pumpAndSettle();

        await tester.tap(find.text('Parar'));
        await tester.pumpAndSettle();

        verify(() => mockTimerViewModel.resetTimer(1,any())).called(1);      
      });
    });

  });
}