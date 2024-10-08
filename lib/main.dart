import 'package:flutter/material.dart';
import 'package:mistakes_tracker/entity/Mistake.dart';
import 'package:mistakes_tracker/mistakes_list.dart';

main() => runApp(MistakesTrackerApp());

class MistakesTrackerApp extends StatelessWidget {
  const MistakesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MistakesTrackerPage(),
    );
  }
}

class MistakesTrackerPage extends StatelessWidget {
  MistakesTrackerPage({super.key});

  final List<Mistake> mistakes = [
    Mistake(title: 'title', quantity: 21, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MistakesList(
          mistakes: mistakes,
          onPlus: _increaseQuantiy,
          onMinus: _decreaseQuantiy),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }

  _increaseQuantiy(int quantity) {
    quantity++;
  }

  _decreaseQuantiy(int quantity) {
    quantity++;
  }
}
