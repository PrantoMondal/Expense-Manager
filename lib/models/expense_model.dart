import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseModel {
  final double amount;
  final String purpose;
  final DateTime date;
  final String? receipt;
  final String? category;
  final String? notes;

  ExpenseModel({
    required this.amount,
    required this.purpose,
    required this.date,
    this.receipt,
    this.category,
    this.notes,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      amount: map['amount'] ?? 0.0,
      purpose: map['purpose'] ?? '',
      date: (map['date'] as Timestamp).toDate(),
      receipt: map['receipt'],
      category: map['category'],
      notes: map['notes'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'purpose': purpose,
      'date': date,
      'receipt': receipt,
      'category': category,
      'notes': notes,
    };
  }
}
