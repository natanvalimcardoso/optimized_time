import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Modular.to.navigate('/login/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8A2BE2),
              Color(0xFF7B68EE),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(90.0),
            child: Center(
              child: Image.asset('assets/images/pngwing.com.png'),
            ),
          ),
        ),
      ),
    );
  }
}
