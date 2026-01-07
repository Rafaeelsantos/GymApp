import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/pages/home/widgets/workout_card.dart';
import 'widgets/graficos/daytreinos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 19, 19, 19),
        title: Image.asset('assets/images/nmlogo.png', height: 50),

        actions: [
          IconButton(
            iconSize: 30,
            color: Colors.deepOrange,
            icon: const Icon(Icons.shopping_cart_sharp),
            onPressed: () {
              //Ação ao clicar no carrinho
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 👈 esquerda
          children: [
            SizedBox(height: 60),

            Text(
              'Bem-vindo de volta',
              style: GoogleFonts.orbitron(
                color: Color.fromARGB(255, 181, 181, 181),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),

            Text(
              'Rafael',
              style: GoogleFonts.orbitron(
                fontSize: 26,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            WorkoutCard(),

            SizedBox(height: 100),

            Text(
              'Seu progresso',
              style: GoogleFonts.orbitron(
                color: Colors.deepOrange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            diasEmColuna(),
          ],
        ),
      ),
    );
  }
}
