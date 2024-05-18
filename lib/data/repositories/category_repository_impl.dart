import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/data/model/category_model.dart';
import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/category_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Result<List<Category>>> getCategories() async {
    try {
      final result = await Supabase.instance.client.from('categories').select();

      return Result.success(
        result
            .map(
              (e) => CategoryModel.fromJson(e).toEntity(),
            )
            .toList(),
      );
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<Category>> getDefaultCategory() async {
    try {
      final result = await Supabase.instance.client
          .from('categories')
          .select()
          .eq('code', 'FOOD')
          .eq('type', 'expense')
          .single();

      return Result.success(CategoryModel.fromJson(result).toEntity());
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
