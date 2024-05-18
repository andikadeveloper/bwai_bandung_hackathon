import 'package:bwai_bandung_hackathon/presentation/cubit/category/category_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/routes/router.dart';
import 'package:bwai_bandung_hackathon/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/di/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  configureDependencies();
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
    postgrestOptions: PostgrestClientOptions(
      schema: dotenv.env['SUPABASE_SCHEMA'] ?? 'public',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<FormTransactionCubit>()),
        BlocProvider(create: (_) => getIt.get<CategoryCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Build with AI Bandung Hackathon',
        theme: theme,
        routerConfig: router,
      ),
    );
  }
}
