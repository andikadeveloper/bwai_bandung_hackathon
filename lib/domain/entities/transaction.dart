import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final int id;
  final Category category;
  final int userId;
  final int amount;
  final String note;
  final DateTime transactionDate;

  const Transaction({
    required this.id,
    required this.category,
    required this.userId,
    required this.amount,
    required this.note,
    required this.transactionDate,
  });

  @override
  List<Object?> get props =>
      [id, category, userId, amount, note, transactionDate];
}
