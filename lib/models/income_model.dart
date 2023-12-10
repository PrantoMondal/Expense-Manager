import 'package:cloud_firestore/cloud_firestore.dart';

class IncomeModel {
  final double amount;
  final String purpose;
  final DateTime date;
  final String? invoice;
  final String? category;
  final String? notes;

  IncomeModel({
    required this.amount,
    required this.purpose,
    required this.date,
    this.invoice,
    this.category,
    this.notes,
  });

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
      amount: map['amount'] ?? 0.0,
      purpose: map['purpose'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      invoice: map['invoice'],
      category: map['category'],
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'purpose': purpose,
      'date': date,
      'invoice': invoice,
      'category': category,
      'notes': notes,
    };
  }
}
