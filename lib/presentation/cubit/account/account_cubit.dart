import 'package:bwai_bandung_hackathon/domain/usecases/get_account_balance.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'account_state.dart';
part 'account_cubit.freezed.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  final GetAccountBalance getAccountBalance;

  AccountCubit(
    this.getAccountBalance,
  ) : super(const AccountState.initial()) {
    getAccount();
  }

  Future<void> getAccount() async {
    var result = await getAccountBalance();
    result.when(
      success: (value) {},
      failure: (message) {},
    );
  }
}
