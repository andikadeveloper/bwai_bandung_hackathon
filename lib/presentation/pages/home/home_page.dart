import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/upsert_transaction_bottom_sheet/upsert_transaction_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => _defaultWelcome(),
              loading: () => _defaultWelcome(),
              success: (value) => _defaultWelcome(),
              failure: (message) => _defaultWelcome(),
              successGetUserApi: (user) => _specificWelcome(
                name: user?.user?.userMetadata?['name'] ?? 'User',
              ),
              successGetUserSession: (user) => _specificWelcome(
                name: user?.user?.userMetadata?['name'] ?? 'User',
              ),
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
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.when(
                  initial: () => _defaultAvatar(),
                  loading: () => _defaultAvatar(),
                  success: (value) => _defaultAvatar(),
                  failure: (message) => _defaultAvatar(),
                  successGetUserApi: (user) => _specificAvatar(
                    url: user?.user?.userMetadata?['avatar_url'],
                  ),
                  successGetUserSession: (user) => _specificAvatar(
                    url: user?.user?.userMetadata?['avatar_url'],
                  ),
                );
              },
            ),
          ),
        ),
        leadingWidth: 72.0,
      ),
      body: Column(
        children: [
          Container(
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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Account Balance',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Rp 50.0000',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
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
                const Text(
                  'Rp 100.000',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
