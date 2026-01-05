import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/nmlogo.png', width: 180),
        const SizedBox(height: 14),
        Text(
          'Bem-vindo de volta',
          style: GoogleFonts.orbitron(
            color: const Color.fromARGB(255, 255, 111, 0),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Entre para continuar',
          style: GoogleFonts.orbitron(
            color: Color.fromARGB(232, 137, 131, 131),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
