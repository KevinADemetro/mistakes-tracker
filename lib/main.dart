import 'package:flutter/material.dart';
import 'package:mistakes_tracker/components/mistake_form.dart';
import 'package:mistakes_tracker/entity/Mistake.dart';
import 'package:mistakes_tracker/components/mistakes_list.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openMistakeFormModal(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  _increaseQuantity(int quantity, int index) {
    setState(() {
      mistakes[index].quantity++;
    });
  }

  _decreaseQuantity(int quantity, int index) {
    if (quantity > 0) {
      setState(() {
        mistakes[index].quantity--;
      });
    }
  }

  _openMistakeFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return MistakeForm(
          onSubmit: _addMistake,
        );
      },
    );
  }

  _addMistake(String title) {
    Mistake mistake =
        new Mistake(title: title, quantity: 0, date: DateTime.now());
    setState(() {
      mistakes.add(mistake);
    });
  }
}
