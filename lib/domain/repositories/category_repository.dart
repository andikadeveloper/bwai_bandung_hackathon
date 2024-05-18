import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Result<List<Category>>> getCategories();

  Future<Result<Category>> getDefaultCategory();
}
