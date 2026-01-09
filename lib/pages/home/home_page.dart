import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymapp/pages/home/widgets/workout_card.dart';
import 'widgets/graficos/daytreinos.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
        elevation: 0,
        title: Image.asset('assets/images/nmlogo.png', height: 50),
        actions: [
          IconButton(
            iconSize: 30,
            color: Colors.deepOrange,
            icon: const Icon(Icons.shopping_cart_sharp),
            onPressed: () {
              // ação futura
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              /// BOAS-VINDAS
              Text(
                'Bem-vindo de volta',
                style: GoogleFonts.orbitron(
                  color: const Color.fromARGB(255, 181, 181, 181),
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Rafael',
                style: GoogleFonts.orbitron(
                  fontSize: 26,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 24),

              /// CARD DE TREINO
              const WorkoutCard(),

              const SizedBox(height: 40),

              /// TÍTULO PROGRESSO
              Text(
                'Seu progresso',
                style: GoogleFonts.orbitron(
                  color: Colors.deepOrange,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(height: 240, child: TreinoemColuna()),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        tabs: const [
          GButton(
            icon: Icons.chat_bubble,
            text: "home",
            textColor: Colors.white,
          ),
          GButton(icon: Icons.fitness_center),
          GButton(icon: Icons.home),
          GButton(icon: Icons.flatware),
          GButton(icon: Icons.person),
        ],
      ),
    );
  }
}
