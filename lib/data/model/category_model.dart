import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/domain/enums/category_type.dart';

class CategoryModel {
  final int? id;
  final String? name;
  final String? code;
  final CategoryType? type;

  CategoryModel({
    this.id,
    this.name,
    this.code,
    this.type,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      type: CategoryType.values.firstWhere(
        (element) => element.name == json['type'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'type': type.toString(),
    };
  }

  Category toEntity() {
    return Category(
      id: id ?? 0,
      name: name ?? '',
      code: code ?? '',
      type: type ?? CategoryType.income,
    );
  }
}
