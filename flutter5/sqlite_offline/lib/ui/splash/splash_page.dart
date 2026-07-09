import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_offline/ui/auth/view_models/auth_view_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void didChangeDependencies() {
    final authViewModel = context.watch<AuthViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((_){
      if (authViewModel.isLoading) return;

      authViewModel.isLoggedIn 
      ? Navigator.pushReplacementNamed(context, '/home')
      : Navigator.pushReplacementNamed(context, '/login');
    });

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFB6FF02),
      body: Center(
        child: Icon(
          Icons.directions_run,
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}