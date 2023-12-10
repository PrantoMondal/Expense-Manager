import 'package:cloud_firestore/cloud_firestore.dart';

class IncomeModel {
  final String uid;

  final double amount;
  final String source;
  final DateTime date;
  final String? invoice;
  final String? category;
  final String? notes;

  IncomeModel({
    required this.uid,
    required this.amount,
    required this.source,
    required this.date,
    this.invoice,
    this.category,
    this.notes,
  });

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
      uid: map['uid'],
      amount: map['amount'] ?? 0.0,
      source: map['source'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      invoice: map['invoice'],
      category: map['category'],
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'amount': amount,
      'source': source,
      'date': date,
      'invoice': invoice,
      'category': category,
      'notes': notes,
    };
  }
}
