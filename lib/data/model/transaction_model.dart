import 'package:bwai_bandung_hackathon/data/model/category_model.dart';
import 'package:bwai_bandung_hackathon/domain/entities/transaction.dart';

class TransactionModel {
  final int? id;
  final CategoryModel? category;
  final String? userId;
  final int? amount;
  final String? note;
  final DateTime? transactionDate;

  TransactionModel({
    required this.id,
    required this.category,
    required this.userId,
    required this.amount,
    required this.note,
    required this.transactionDate,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      category: CategoryModel.fromJson(json['category']),
      userId: json['user_id'],
      amount: json['amount'],
      note: json['note'],
      transactionDate: DateTime.parse(json['transaction_date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category?.toJson(),
      'user_id': userId,
      'amount': amount,
      'note': note,
      'transaction_date': transactionDate?.toIso8601String(),
    };
  }

  Transaction toEntity() {
    final categoryModel = category ?? CategoryModel();

    return Transaction(
      id: id ?? 0,
      category: categoryModel.toEntity(),
      userId: userId ?? '',
      amount: amount ?? 0,
      note: note ?? '',
      transactionDate: transactionDate ?? DateTime.now(),
    );
  }
}
