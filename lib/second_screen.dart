import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();

  double totalExpense = 0;
  double totalIncome = 0;

  void addExpense() {
    final input = expenseController.text.trim();
    if (input.isNotEmpty) {
      final amount = double.tryParse(input);
      if (amount != null) {
        setState(() {
          totalExpense += amount;
          expenseController.clear();
        });
      }
    }
  }

  void addIncome() {
    final input = incomeController.text.trim();
    if (input.isNotEmpty) {
      final amount = double.tryParse(input);
      if (amount != null) {
        setState(() {
          totalIncome += amount;
          incomeController.clear();
        });
      }
    }
  }

  void finishAndReturn() {
    Navigator.pop(context, {
      'income': totalIncome,
      'expense': totalExpense,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Income & Expense"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            /// Expense Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Expenses", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  TextField(
                    controller: expenseController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Enter expense",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(onPressed: addExpense, child: const Text("Add Expense")),
                  const SizedBox(height: 10),
                  Text("Total Expenses: ₹${totalExpense.toStringAsFixed(2)}"),
                ],
              ),
            ),

            const SizedBox(width: 20),

            /// Income Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Income", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  TextField(
                    controller: incomeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Enter income",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(onPressed: addIncome, child: const Text("Add Income")),
                  const SizedBox(height: 10),
                  Text("Total Income: ₹${totalIncome.toStringAsFixed(2)}"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: finishAndReturn,
        label: const Text("Finish"),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
