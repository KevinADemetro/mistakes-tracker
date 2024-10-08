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

class MistakesTrackerPage extends StatefulWidget {
  MistakesTrackerPage({super.key});

  @override
  State<MistakesTrackerPage> createState() => _MistakesTrackerPageState();
}

class _MistakesTrackerPageState extends State<MistakesTrackerPage> {
  final List<Mistake> mistakes = [
    Mistake(title: 'title', quantity: 21, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MistakesList(
          mistakes: mistakes,
          onPlus: _increaseQuantity,
          onMinus: _decreaseQuantity),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }

  _increaseQuantity(int quantity, int index) {
    setState(() {
      mistakes[index].quantity++;
    });
  }

  _decreaseQuantity(int quantity, int index) {
    setState(() {
      mistakes[index].quantity--;
    });
  }
}
