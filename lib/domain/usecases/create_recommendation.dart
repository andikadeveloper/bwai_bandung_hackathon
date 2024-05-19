import 'package:bwai_bandung_hackathon/core/extensions/string_extensions.dart';
import 'package:bwai_bandung_hackathon/core/result/result.dart';
import 'package:bwai_bandung_hackathon/domain/entities/transaction.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/gemini_repository.dart';
import 'package:bwai_bandung_hackathon/domain/repositories/transaction_repository.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateRecommendation {
  final GeminiRepository _geminiRepository;
  final TransactionRepository _transactionRepository;

  CreateRecommendation(this._geminiRepository, this._transactionRepository);

  Future<Result<GenerateContentResponse>> call() async {
    // get DateTime for last day of this month
    final DateTime now = DateTime.now();
    final DateTime lastDayOfThisMonth = DateTime(now.year, now.month + 1, 0);

    // get DateTime for first day of this month
    final DateTime firstDayOfThisMonth = DateTime(now.year, now.month, 1);

    final Result<List<Transaction>> transactions =
        await _transactionRepository.getTransactions(
      startDate: firstDayOfThisMonth,
      endDate: lastDayOfThisMonth,
    );

    final List<Content> promptContent = transactions.when(
      success: (data) {
        final List<Content> content = [
          Content.text(
            'Based on these transaction data. Give me financial recommendation that I can improve to save more money and make me become financial freedom. The output should be a list existing my expense that I can reduce and Also my next investment for my budget.',
          ),
          Content.text('Input:'),
        ];
        List<Transaction> transactions = data;

        for (int i = 0; i < transactions.length; i++) {
          final number = i + 1;
          final transaction = transactions[i];
          final category = transaction.category;
          final categoryType = category.type.name.capitalize();
          final categoryName = category.name;
          final amount = transaction.amount;

          final contentText =
              '$number. $categoryName - $categoryType: Rp $amount';

          content.add(Content.text(contentText));
        }

        return content;
      },
      failure: (message) {
        return [];
      },
    );
    return _geminiRepository.generateContent(promptContent);
  }
}
