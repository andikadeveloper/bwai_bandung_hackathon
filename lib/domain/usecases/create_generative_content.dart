import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/gemini_repository.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateGenerativecontent {
  final GeminiRepository repository;

  CreateGenerativecontent(this.repository);

  Future<Result<GenerateContentResponse>> call(List<Content> content) {
    return repository.generateContent(content);
  }
}
