import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/add_transaction_bottom_sheet/add_transaction_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Text('Hi, User👋'),
              loading: () => const Text('Hi, User👋'),
              success: (value) => const Text('Hi, User👋'),
              failure: (message) => const Text('Hi, User👋'),
              successGetUserApi: (user) =>
                  Text('Hi, ${user?.user?.userMetadata?['name'] ?? 'User'}👋'),
              successGetUserSession: (user) =>
                  Text('Hi, ${user?.user?.userMetadata?['name'] ?? 'User'}👋'),
            );
          },
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        leading: GestureDetector(
          onTap: () => context.read<HomeCubit>().goToProfileOrLogin(context),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.when(
                initial: () => const CircleAvatar(
                  child: Text('U'),
                ),
                loading: () => const CircleAvatar(
                  child: Text('U'),
                ),
                success: (value) => const CircleAvatar(
                  child: Text('U'),
                ),
                failure: (message) => const CircleAvatar(
                  child: Text('U'),
                ),
                successGetUserApi: (user) => CircleAvatar(
                  backgroundImage: NetworkImage(
                    user?.user?.userMetadata?['avatar_url'],
                  ),
                ),
                successGetUserSession: (user) => CircleAvatar(
                  backgroundImage: NetworkImage(
                    user?.user?.userMetadata?['avatar_url'],
                  ),
                ),
              );
            },
          ),
        ),
        leadingWidth: 60.0,
      ),
      body: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Text('Hi, welcome to the home page'),
              loading: () => const CircularProgressIndicator(),
              failure: (message) => Text(message),
              success: (data) {
                return Text(data.text ?? '');
              },
              successGetUserApi: (user) {
                return const Text('Hi, welcome to the home page');
              },
              successGetUserSession: (user) {
                return const Text('Hi, welcome to the home page');
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const AddTransactionBottomSheet();
            },
          );
        },
      ),
    );
  }
}
