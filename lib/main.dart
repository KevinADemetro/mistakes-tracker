import 'package:flutter/material.dart';
import 'package:mistakes_tracker/components/mistake_form.dart';
import 'package:mistakes_tracker/database/database_helper.dart';
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
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Mistake> _mistakes = [
    Mistake(title: 'title', quantity: 21, date: DateTime.now())
  ];

  @override
  void initState() {
    super.initState();
    _loadMistakes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MistakesList(
          mistakes: _mistakes,
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
      _mistakes[index].quantity++;
    });
  }

  _decreaseQuantity(int quantity, int index) {
    if (quantity > 0) {
      setState(() {
        _mistakes[index].quantity--;
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
    _insertMistake(mistake);
    Navigator.of(context).pop();
  }

  Future<void> _insertMistake(Mistake mistake) async{
    await _dbHelper.insertMistake(mistake);
    _loadMistakes(); 
  }

  Future<void> _loadMistakes() async {
    List<Mistake> mistakes = await _dbHelper.getMistakes();
    setState(() {
      _mistakes = mistakes;
    });
  }
}
