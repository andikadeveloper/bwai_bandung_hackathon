import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/domain/usecases/get_categories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategories _getCategories;

  CategoryCubit(this._getCategories) : super(const CategoryState.initial());

  Future<void> getCategories() async {
    emit(const CategoryState.loading());

    final result = await _getCategories();

    result.when(
      success: (value) {
        emit(CategoryState.success(value));
      },
      failure: (message) {
        emit(CategoryState.failure(message));
      },
    );
  }
}
