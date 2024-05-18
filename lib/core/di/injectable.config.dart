// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bwai_bandung_hackathon/data/repositories/gemini_repository_impl.dart'
    as _i4;
import 'package:bwai_bandung_hackathon/data/repositories/transaction_repository_impl.dart'
    as _i7;
import 'package:bwai_bandung_hackathon/domain/repositories/gemini_repository.dart'
    as _i3;
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart'
    as _i6;
import 'package:bwai_bandung_hackathon/domain/usecases/create_generative_content.dart'
    as _i8;
import 'package:bwai_bandung_hackathon/domain/usecases/create_transaction.dart'
    as _i9;
import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart'
    as _i11;
import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart'
    as _i10;
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
    gh.lazySingleton<_i6.TransactionRepository>(
        () => _i7.TransactionRepositoryImpl());
    gh.factory<_i8.CreateGenerativecontent>(
        () => _i8.CreateGenerativecontent(gh<_i3.GeminiRepository>()));
    gh.factory<_i9.CreateTransaction>(
        () => _i9.CreateTransaction(gh<_i6.TransactionRepository>()));
    gh.factory<_i10.HomeCubit>(
        () => _i10.HomeCubit(gh<_i8.CreateGenerativecontent>()));
    gh.factory<_i11.FormTransactionCubit>(
        () => _i11.FormTransactionCubit(gh<_i9.CreateTransaction>()));
    return this;
  }
}
