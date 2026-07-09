import 'package:flutter/material.dart';
import 'package:new_fiap_rest/app/core/containers/injection_container.dart'
    as injection;
import 'package:new_fiap_rest/app/core/containers/router_container.dart'
    as router;
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  injection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'UseDev',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      routerConfig: router.getRoutes,
    );
  }
}
