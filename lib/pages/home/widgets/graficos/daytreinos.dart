import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TreinoemColuna extends StatelessWidget {
  TreinoemColuna({super.key});

  final List<double> values = [1, 0.2, 0.8, 0.9, 1, 0, 0];

  final List<String> days = ['S', 'T', 'Q', 'Q', 'S', 'S', 'D'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TÍTULO
          Text(
            'Treinos na Semana',
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 20),

          /// GRÁFICO
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 1,
                barTouchData: BarTouchData(enabled: false),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            days[value.toInt()],
                            style: GoogleFonts.orbitron(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                barGroups: List.generate(values.length, (index) {
                  final isActive = values[index] > 0;

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: values[index],
                        width: 14,
                        borderRadius: BorderRadius.circular(10),
                        color: isActive ? Colors.deepOrange : Colors.white12,
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// FOOTER
          Center(
            child: Text(
              '4 de 5 Treinos',
              style: GoogleFonts.orbitron(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
