import 'package:flutter/material.dart';

main() => runApp(MistakesTrackerApp());

class MistakesTrackerApp extends StatelessWidget {
  const MistakesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      home: MistakesTrackerPage(),
    );
  }
}

class MistakesTrackerPage extends StatelessWidget {
  MistakesTrackerPage({super.key});

  final List<Map<String, String>> lista = [
    {'title' : 'teste'},
    {'title' : 'teste2'}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (ctx, index) {
          final itemList = lista[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              title: Text(
                itemList['title'].toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: IconButton(
                onPressed: null,
                icon: Icon(Icons.add),
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        },
      ),
    );
  }
}
