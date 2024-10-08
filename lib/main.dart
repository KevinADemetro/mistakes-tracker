import 'package:flutter/material.dart';

main() => runApp(MistakesTrackerApp());

class MistakesTrackerApp extends StatelessWidget {
  const MistakesTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MistakesTrackerPage();
  }
}

class MistakesTrackerPage extends StatelessWidget {
  MistakesTrackerPage({super.key});

  final lista = [

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (ctx, index) {
          final itemList = lista[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              title: Text(
                itemList.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: IconButton(
                onPressed: null,
                icon: Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        },
      ),
    );
  }
}
