import 'package:bwai_bandung_hackathon/core/di/injectable.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/home_page.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/recommendation/cubit/recommendation_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/recommendation/recommendation_page.dart';
import 'package:bwai_bandung_hackathon/presentation/routes/path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: PathRoute.home,
      builder: (context, state) => BlocProvider<HomeCubit>(
        create: (context) => getIt.get<HomeCubit>(),
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: PathRoute.recommendation,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            getIt.get<RecommendationCubit>()..getRecommendation(),
        child: const RecommendationPage(),
      ),
    ),
  ],
);
