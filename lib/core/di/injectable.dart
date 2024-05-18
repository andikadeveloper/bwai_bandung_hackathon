import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();

  getIt.registerLazySingleton<GenerativeModel>(
    () {
      final apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

      final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

      return model;
    },
  );
}
