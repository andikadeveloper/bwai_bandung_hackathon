import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategories {
  final CategoryRepository _repository;

  GetCategories(this._repository);

  Future<Result<List<Category>>> call() {
    return _repository.getCategories();
  }
}
