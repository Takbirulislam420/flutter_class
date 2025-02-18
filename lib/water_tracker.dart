import 'package:flutter/material.dart';
import 'package:flutter_class/widget_file/add_water.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int currentInTake = 0;
  final ourGoal = 2000;

  void waterAdd(int amount) {
    setState(() {
      if (currentInTake < ourGoal) {
        currentInTake = (currentInTake + amount).clamp(0, ourGoal);
      }
    });
  }

  void resetWater() {
    setState(() {
      currentInTake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double myProgress = (currentInTake / ourGoal).clamp(0.0, 1.0);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text("Water tracker"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2)
                  ]),
              child: Column(
                children: [
                  const Text(
                    "Todays take",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$currentInTake ml',
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: myProgress,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.blueAccent,
                    strokeWidth: 3,
                  ),
                ),
                Text(
                  "${(myProgress * 100).toInt()}%",
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 15,
              children: [
                AddWater(
                  amount: 200,
                  onclick: () {
                    waterAdd(200);
                  },
                ),
                AddWater(
                  amount: 300,
                  icon: Icons.local_airport,
                  onclick: () {
                    waterAdd(300);
                  },
                ),
                AddWater(
                  amount: 400,
                  icon: Icons.local_drink,
                  onclick: () {
                    waterAdd(400);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    resetWater();
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
