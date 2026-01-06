import 'package:flutter/material.dart';
import 'widgets/glass_container.dart';
import 'widgets/logo_header.dart';
import 'widgets/cadastro_form.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/banner.png', fit: BoxFit.cover),
          ),

          Center(
            child: GlassContainer(
              width: 450,
              height: 900,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 40,
                ),
                child: Column(
                  children: const [
                    LogoHeader(),
                    SizedBox(height: 20),
                    CadastroForm(), // <-- form modularizado
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
