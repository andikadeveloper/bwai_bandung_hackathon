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
      body: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Text('Hi, welcome to the home page'),
              loading: () => const CircularProgressIndicator(),
              failure: (message) => Text(
                message,
                textAlign: TextAlign.center,
              ),
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
}
