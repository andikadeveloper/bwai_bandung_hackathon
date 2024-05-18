import 'package:bwai_bandung_hackathon/domain/enums/category_type.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String code;
  final CategoryType type;

  const Category({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
  });

  @override
  List<Object?> get props => [id, name, code, type];
}
