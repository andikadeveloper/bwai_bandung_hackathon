// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bwai_bandung_hackathon/data/repositories/category_repository_impl.dart'
    as _i7;
import 'package:bwai_bandung_hackathon/data/repositories/gemini_repository_impl.dart'
    as _i4;
import 'package:bwai_bandung_hackathon/data/repositories/transaction_repository_impl.dart'
    as _i9;
import 'package:bwai_bandung_hackathon/domain/repositories/category_repository.dart'
    as _i6;
import 'package:bwai_bandung_hackathon/domain/repositories/gemini_repository.dart'
    as _i3;
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart'
    as _i8;
import 'package:bwai_bandung_hackathon/domain/usecases/create_generative_content.dart'
    as _i10;
import 'package:bwai_bandung_hackathon/domain/usecases/get_categories.dart'
    as _i13;
import 'package:bwai_bandung_hackathon/domain/usecases/get_default_category.dart'
    as _i12;
import 'package:bwai_bandung_hackathon/domain/usecases/get_transaction_by_id.dart'
    as _i11;
import 'package:bwai_bandung_hackathon/domain/usecases/upsert_transaction.dart'
    as _i14;
import 'package:bwai_bandung_hackathon/presentation/cubit/category/category_cubit.dart'
    as _i16;
import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart'
    as _i17;
import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart'
    as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_generative_ai/google_generative_ai.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.GeminiRepository>(
        () => _i4.GeminiRepositoryImpl(gh<_i5.GenerativeModel>()));
    gh.lazySingleton<_i6.CategoryRepository>(
        () => _i7.CategoryRepositoryImpl());
    gh.lazySingleton<_i8.TransactionRepository>(
        () => _i9.TransactionRepositoryImpl());
    gh.factory<_i10.CreateGenerativecontent>(
        () => _i10.CreateGenerativecontent(gh<_i3.GeminiRepository>()));
    gh.factory<_i11.GetTransactionById>(
        () => _i11.GetTransactionById(gh<_i8.TransactionRepository>()));
    gh.factory<_i12.GetDefaultCategory>(
        () => _i12.GetDefaultCategory(gh<_i6.CategoryRepository>()));
    gh.factory<_i13.GetCategories>(
        () => _i13.GetCategories(gh<_i6.CategoryRepository>()));
    gh.factory<_i14.UpsertTransaction>(
        () => _i14.UpsertTransaction(gh<_i8.TransactionRepository>()));
    gh.factory<_i15.HomeCubit>(
        () => _i15.HomeCubit(gh<_i10.CreateGenerativecontent>()));
    gh.factory<_i16.CategoryCubit>(
        () => _i16.CategoryCubit(gh<_i13.GetCategories>()));
    gh.factory<_i17.FormTransactionCubit>(() => _i17.FormTransactionCubit(
          gh<_i14.UpsertTransaction>(),
          gh<_i12.GetDefaultCategory>(),
          gh<_i11.GetTransactionById>(),
        ));
    return this;
  }
}
