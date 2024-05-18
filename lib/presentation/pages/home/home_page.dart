import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/add_transaction_bottom_sheet/add_transaction_bottom_sheet.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hi, Andika👋'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        leading: GestureDetector(
          onTap: () => context.push(PathRoute.login),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://reqres.in/img/faces/7-image.jpg',
            ),
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
