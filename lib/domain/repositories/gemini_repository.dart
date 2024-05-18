import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

abstract class GeminiRepository {
  Future<Result<GenerateContentResponse>> generateContent(
    List<Content> content,
  );
}
