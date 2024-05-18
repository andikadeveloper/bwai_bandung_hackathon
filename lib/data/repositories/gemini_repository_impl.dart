import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/gemini_repository.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GeminiRepository)
class GeminiRepositoryImpl implements GeminiRepository {
  final GenerativeModel model;

  GeminiRepositoryImpl(this.model);

  @override
  Future<Result<GenerateContentResponse>> generateContent(
    List<Content> content,
  ) async {
    try {
      final response = await model.generateContent(content);

      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }
}
