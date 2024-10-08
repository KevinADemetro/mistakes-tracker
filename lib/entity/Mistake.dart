class Mistake {
  final int? id;
  final String title;
  int quantity;
  final DateTime date;

  Mistake(
      {this.id,
      required this.title,
      required this.quantity,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'quantity': quantity,
      'date': date.toIso8601String(),
    };
  }

  factory Mistake.fromMap(Map<String, dynamic> map) {
    return Mistake(
      id: map['id'],
      title: map['title'],
      quantity: map['quantity'],
      date: DateTime.parse(map['date']),
    );
  }
}
