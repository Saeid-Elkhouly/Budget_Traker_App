import 'package:flutter/material.dart';

void main() {
  runApp(const BudgetTrackerApp());
}

class BudgetTrackerApp extends StatelessWidget {
  const BudgetTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        // body: Center(
        //   child: Image.asset('assets/images/Logo-removebg-preview.png'),
        // ),
      ),
    );
  }
}
