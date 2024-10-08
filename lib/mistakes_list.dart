import 'package:flutter/material.dart';
import 'package:mistakes_tracker/entity/Mistake.dart';

class MistakesList extends StatelessWidget {
  final List<Mistake> mistakes;
  final void Function(int, int) onMinus;
  final void Function(int, int) onPlus;

  MistakesList({
    super.key,
    required this.mistakes,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: mistakes.length,
        itemBuilder: (ctx, index) {
          final mistake = mistakes[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Text('${mistake.quantity}'),
                ),
                title: Text(
                  mistake.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: FittedBox(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => onMinus(mistake.quantity, index),
                        icon: const Icon(Icons.remove),
                        color: Theme.of(context).colorScheme.error,
                      ),
                      IconButton(
                        onPressed:() => onPlus(mistake.quantity, index),
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
