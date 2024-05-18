import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDefaultCategory {
  final CategoryRepository _categoryRepository;

  GetDefaultCategory(this._categoryRepository);

  Future<Result<Category>> call() {
    return _categoryRepository.getDefaultCategory();
  }
}
