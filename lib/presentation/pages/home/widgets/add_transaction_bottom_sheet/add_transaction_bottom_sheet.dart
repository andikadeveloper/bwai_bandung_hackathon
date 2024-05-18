import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/widgets/add_transaction_bottom_sheet/amount_section.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/widgets/add_transaction_bottom_sheet/category_section.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/widgets/add_transaction_bottom_sheet/date_section.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/widgets/add_transaction_bottom_sheet/note_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddTransactionBottomSheet extends StatefulWidget {
  const AddTransactionBottomSheet({
    super.key,
  });

  @override
  State<AddTransactionBottomSheet> createState() =>
      _AddTransactionBottomSheetState();
}

class _AddTransactionBottomSheetState extends State<AddTransactionBottomSheet> {
  @override
  void initState() {
    super.initState();

    context.read<FormTransactionCubit>().getDefaultCategory();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (canPop) {
        context.read<FormTransactionCubit>().reset();
      },
      child: BlocConsumer<FormTransactionCubit, FormTransactionState>(
        listenWhen: (previous, current) =>
            previous.isSuccess != current.isSuccess,
        listener: (context, state) {
          if (state.isSuccess) {
            context.pop();
          }
        },
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.fromLTRB(
              16.0,
              16.0,
              16.0,
              MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Amount
                    const AmountSection(),

                    // Note
                    const NoteSection(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Category
                        CategorySection(selectedCategory: state.category),

                        const SizedBox(width: 8.0),

                        // Date
                        DateSection(
                            selectedTransactionDate: state.transactionDate),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(),
                    ),

                    // Send button
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed:
                            context.read<FormTransactionCubit>().addTransaction,
                        icon: const Icon(Icons.send),
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),

                // Loading
                if (state.isLoading) const CircularProgressIndicator(),
              ],
            ),
          );
        },
      ),
    );
  }
}
