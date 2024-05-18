import 'package:bwai_bandung_hackathon/core/di/injectable.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/cubit/home_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/home_page.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/login/cubit/login_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/login/login_page.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/profile/profile_page.dart';
import 'package:bwai_bandung_hackathon/presentation/routes/path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: PathRoute.home,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt.get<HomeCubit>(),
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: PathRoute.profile,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt.get<ProfileCubit>(),
        child: const ProfilePage(),
      ),
    ),
    GoRoute(
      path: PathRoute.login,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt.get<LoginCubit>(),
        child: const LoginPage(),
      ),
    ),
  ],
);
