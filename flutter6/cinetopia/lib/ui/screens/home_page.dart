import 'package:cinetopia/ui/components/primary_button.dart';
import 'package:cinetopia/ui/screens/layout_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF1D0E44)],
            begin: AlignmentGeometry.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              Image.asset('assets/logo.png'),
              Image.asset('assets/splash.png'),
              Text(
                "O lugar ideal para buscar, salvar e organizar seus filmes favoritos!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              PrimaryButton(
                text: "Quero começar",
                icon: Icons.arrow_forward,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LayoutScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
