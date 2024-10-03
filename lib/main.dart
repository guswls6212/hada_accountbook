import 'package:flutter/material.dart';
import './expese_input.dart';
import './home.dart';
import './expense_list.dart';
import 'basic_calendar.dart';
import './step_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hada Accountbook!',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StepCalendar()

        // BasicCalendar(),
        // ExpenseList(expenses: generateDummyExpenses())
        // TransactionApp(),
        // ExpenseInputScreen(),
        // const MyHomePage(title: 'Hada Accountbook!'),
        );
  }
}
