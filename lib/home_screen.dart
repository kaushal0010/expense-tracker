import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double income = 0;
  double expense = 0;

  double get netWorth => income - expense;

  void goToSecondScreen() async {
    // Wait for result from SecondScreen
    final result = await Navigator.pushNamed(context, '/second');

    if (result != null && result is Map<String, double>) {
      setState(() {
        income = result['income'] ?? 0;
        expense = result['expense'] ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(255, 193, 227, 3),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Net Worth: ₹${netWorth.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: goToSecondScreen,
              child: const Text("Go to Tracker"),
            ),
          ],
        ),
      ),
    );
  }
}
