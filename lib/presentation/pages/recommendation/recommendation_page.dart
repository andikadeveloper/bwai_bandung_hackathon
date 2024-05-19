import 'package:bwai_bandung_hackathon/presentation/pages/recommendation/cubit/recommendation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lottie/lottie.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: BlocBuilder<RecommendationCubit, RecommendationState>(
            builder: (context, state) {
              return state.when(
                initial: () =>
                    const Text('Generate your financial recommendation'),
                loading: () => Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/animations/animation-gemini.json',
                    width: 200,
                  ),
                ),
                success: (content) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/finance-pie.png', width: 200),
                    const SizedBox(height: 20),
                    MarkdownBody(
                      data: content.text ??
                          'There is no financial recommendation for now',
                    ),
                  ],
                ),
                failure: (message) => Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/finance-pie.png', width: 200),
                      const SizedBox(height: 20),
                      const MarkdownBody(
                        data: 'There is no financial recommendation for now',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
