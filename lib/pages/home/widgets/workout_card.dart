import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/costas.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.99),
              Colors.black.withOpacity(0.70),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.calendar_today, size: 14, color: Colors.white70),
                  SizedBox(width: 6),
                  Text(
                    'Terça-Feira, 06 de Janeiro',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                'TREINO DE HOJE:',
                style: GoogleFonts.orbitron(
                  color: Colors.deepOrange,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Costas',
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              _infoRow(Icons.fitness_center, 'Costas e Tríceps'),
              _infoRow(Icons.timer, '60 min'),
              _infoRow(Icons.local_fire_department, '400k'),

              const Spacer(),

              SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  label: const Text(
                    'INICIAR TREINO',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.deepOrange),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
