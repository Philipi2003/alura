import 'package:flutter/material.dart';
import 'package:new_curso_navegacao_app/app/shared/enums/timer_type.dart';
import 'package:new_curso_navegacao_app/app/shared/utils/routes.dart';
import 'package:new_curso_navegacao_app/app/view/pages/home_page.dart';
import 'package:new_curso_navegacao_app/app/view/pages/timer_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_curso_navegacao_app/app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerViewModel(),
      child: MaterialApp(
        routes: appRoutes,
        title: 'Fokus',
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.unboundedTextTheme(),
        ),
        initialRoute: '/home',
      ),
    );
  }
}
