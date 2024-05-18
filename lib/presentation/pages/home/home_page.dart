import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://reqres.in/img/faces/7-image.jpg',
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
        onPressed: () async {
          final content = [
            Content.text('Hello, how are you?'),
          ];

          context.read<HomeCubit>().generateContent(content);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
