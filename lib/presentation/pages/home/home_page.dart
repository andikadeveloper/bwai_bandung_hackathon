import 'package:bwai_bandung_hackathon/domain/entities/transaction.dart';
import 'package:bwai_bandung_hackathon/domain/enums/category_type.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/account/account_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/transaction/transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/user/user_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'widgets/upsert_transaction_bottom_sheet/upsert_transaction_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return state.when(
              initial: () => _defaultWelcome(),
              loading: () => _defaultWelcome(),
              success: (user) => _specificWelcome(
                name: user?.user?.userMetadata?['name'] ?? 'User',
              ),
              failure: (message) => _defaultWelcome(),
            );
          },
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => context.read<HomeCubit>().goToProfileOrLogin(context),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                return state.when(
                  initial: () => _defaultAvatar(),
                  loading: () => _defaultAvatar(),
                  success: (user) => _specificAvatar(
                    url: user?.user?.userMetadata?['avatar_url'],
                  ),
                  failure: (message) => _defaultAvatar(),
                );
              },
            ),
          ),
        ),
        leadingWidth: 72.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () =>
                  context.read<HomeCubit>().goToRecommendationOrLogin(context),
              child: Lottie.asset(
                'assets/animations/animation-ai.json',
                width: 50,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _detailHeaderSection(),
          Expanded(
            child: BlocBuilder<TransactionCubit, TransactionState>(
              builder: (context, state) {
                return state.when(
                    initial: () => const SizedBox(),
                    loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    success: (listTransaction) {
                      return ListView.builder(
                        itemCount: listTransaction?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return UpsertTransactionBottomSheet(
                                    transactionId: listTransaction?[index].id,
                                  );
                                },
                              );
                            },
                            child: ListTile(
                              title: Text(
                                  listTransaction?[index].category.name ?? ''),
                              subtitle: _amountText(
                                  amount: listTransaction?[index].amount),
                              trailing: const Icon(Icons.chevron_right_rounded),
                            ),
                          );
                        },
                      );
                    },
                    failure: (mesaage) => const SizedBox());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const UpsertTransactionBottomSheet();
            },
          );
        },
      ),
    );
  }

  Widget _defaultWelcome() => const Text('Hi, User👋');

  Widget _specificWelcome({required String name}) => Text('Hi, $name👋');

  Widget _defaultAvatar() {
    return const CircleAvatar(
      child: Text('U'),
    );
  }

  Widget _specificAvatar({String? url}) {
    if (url == null || url.isEmpty) {
      return _defaultAvatar();
    }

    return CircleAvatar(
      backgroundImage: NetworkImage(
        url,
      ),
    );
  }

  Widget _boxIncomeExpense({required bool isIncome}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: isIncome ? Colors.green[200] : Colors.redAccent[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(isIncome ? Icons.input : Icons.output),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isIncome ? 'Income' : 'Expense',
                  textAlign: TextAlign.left,
                ),
                BlocBuilder<TransactionCubit, TransactionState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => _amountText(),
                      loading: () => _amountText(),
                      success: (List<Transaction>? listTransaction) {
                        if (listTransaction != null) {
                          int amountIncome = 0, amountExpense = 0;
                          for (var transaction in listTransaction) {
                            if (transaction.category.type ==
                                CategoryType.expense) {
                              amountExpense += transaction.amount;
                              continue;
                            }
                            amountIncome += transaction.amount;
                          }

                          if (isIncome) {
                            return _amountText(amount: amountIncome);
                          }
                          return _amountText(amount: amountExpense);
                        }
                        return _amountText();
                      },
                      failure: (message) => _amountText(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatAmount(int amount) {
    var numberFormat = NumberFormat.decimalPatternDigits(
      locale: 'ID',
      decimalDigits: 0,
    );
    return numberFormat.format(amount);
  }

  Widget _amountText({
    int? amount,
    TextAlign? textAlign = TextAlign.left,
    TextStyle? style,
  }) {
    return Text(
      'Rp ${_formatAmount(amount ?? 0)}',
      textAlign: textAlign,
      style: style,
    );
  }

  Widget _detailHeaderSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.deepPurple[50],
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Account Balance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                BlocBuilder<AccountCubit, AccountState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => _amountText(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      loading: () => _amountText(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      success: (amount) {
                        return _amountText(
                          amount: amount,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                      failure: (message) => _amountText(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //income
                  _boxIncomeExpense(isIncome: true),
                  //expense
                  _boxIncomeExpense(isIncome: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
