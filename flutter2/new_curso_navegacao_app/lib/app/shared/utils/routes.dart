import 'package:flutter/material.dart';
import 'package:new_curso_navegacao_app/app/shared/enums/timer_type.dart';
import 'package:new_curso_navegacao_app/app/view/pages/home_page.dart';
import 'package:new_curso_navegacao_app/app/view/pages/timer_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = <String, WidgetBuilder>{
  '/home':(context) => HomePage(),
  '/timer':(context) => TimerPage(timerType: (ModalRoute.of(context)!.settings.arguments as TimerType?) ?? TimerType.focus)
};