import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:new_curso_navegacao_app/app/shared/utils/routes.dart';
import 'package:new_curso_navegacao_app/app/view/pages/home_page.dart';
import 'package:new_curso_navegacao_app/app/view/pages/timer_page.dart';
import 'package:new_curso_navegacao_app/app/view/widgets/timer_widget.dart';
import 'package:new_curso_navegacao_app/app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';

class MockTimerViewModel extends Mock implements TimerViewModel{

}

void main(){
  late MockTimerViewModel mockTimerViewModel;

  Widget createWidget(){
    return ChangeNotifierProvider<TimerViewModel>.value(
      value: mockTimerViewModel,
      child: MaterialApp(
        home: Scaffold(body: HomePage(),),
        routes: appRoutes,
      ));
  }

  setUpAll((){
    registerFallbackValue(ValueNotifier<bool>(true));
  });

  setUp((){
    mockTimerViewModel = MockTimerViewModel();

    when(() => mockTimerViewModel.actualTimerInSeconds).thenReturn(60);
    when(() => mockTimerViewModel.isPlaying).thenReturn(false);
  });

  group('HomePage - ', (){
    group("Modo foco", (){
      testWidgets('Lista os modos e renderiza os botões da página do timer', (tester) async{
        await tester.pumpWidget(createWidget());

        expect(find.text('Modo foco'), findsOneWidget);
        expect(find.text('Pausa Curta'), findsOneWidget);
        expect(find.text('Pausa Longa'), findsOneWidget);

        await tester.tap(find.text('Modo Foco'));
        await tester.pumpAndSettle();

        expect(find.byType(TimerPage), findsOneWidget);
        expect(find.byType(TimerWidget), findsOneWidget);
      });
    });

    group("Pausa Curta", (){
      testWidgets('Lista os modos e renderiza os botões da página do timer', (tester) async{
        await tester.pumpWidget(createWidget());

        expect(find.text('Modo foco'), findsOneWidget);
        expect(find.text('Pausa Curta'), findsOneWidget);
        expect(find.text('Pausa Longa'), findsOneWidget);

        await tester.tap(find.text('Pausa Curta'));
        await tester.pumpAndSettle();

        expect(find.byType(TimerPage), findsOneWidget);
        expect(find.byType(TimerWidget), findsOneWidget);
      });
    });
    group("Pausa Longa", (){
      testWidgets('Lista os modos e renderiza os botões da página do timer', (tester) async{
        await tester.pumpWidget(createWidget());

        expect(find.text('Modo foco'), findsOneWidget);
        expect(find.text('Pausa Curta'), findsOneWidget);
        expect(find.text('Pausa Longa'), findsOneWidget);

        await tester.tap(find.text('Pausa Longa'));
        await tester.pumpAndSettle();

        expect(find.byType(TimerPage), findsOneWidget);
        expect(find.byType(TimerWidget), findsOneWidget);
      });
    });
  });
}