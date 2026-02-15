import 'package:flutter/material.dart';

class StepsAndEnergySection extends StatefulWidget {
  const StepsAndEnergySection({super.key});

  @override
  State<StepsAndEnergySection> createState() => _StepsAndEnergySectionState();
}

class _StepsAndEnergySectionState extends State<StepsAndEnergySection> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.directions_walk, color: Colors.pinkAccent),
                      SizedBox(height: 8),
                      Text("Bugünkü addımlar", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("7,532", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.local_fire_department, color: Colors.deepPurple),
                      SizedBox(height: 8),
                      Text("Kalori", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("426 kcal", style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
