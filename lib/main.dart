import 'package:flutter/material.dart';

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

  final List<Map<String, Object>> lista = [
    {'title': 'teste', 'qtd': 1},
    {'title': 'teste2', 'qtd': 23}
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
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Text('${itemList['qtd']}'),
                ),
                title: Text(
                  itemList['title'].toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: FittedBox(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: const Icon(Icons.remove),
                        color: Theme.of(context).colorScheme.error,
                      ),
                      IconButton(
                        onPressed: null,
                        icon: const Icon(Icons.add),
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
