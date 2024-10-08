import 'package:flutter/material.dart';

class MistakeForm extends StatefulWidget {
  final void Function(String) onSubmit;

  const MistakeForm({super.key, required this.onSubmit});

  @override
  State<MistakeForm> createState() => _MistakeFormState();
}

class _MistakeFormState extends State<MistakeForm> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text(
                    'Novo erro',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _submitForm() {
    final title = _titleController.text;

    if (title.isEmpty) {
      return;
    }
    widget.onSubmit(title);
  }
}
