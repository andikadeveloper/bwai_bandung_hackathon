import 'package:bwai_bandung_hackathon/presentation/cubit/account/account_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/transaction/transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/widgets/upsert_transaction_bottom_sheet/amount_section.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/widgets/upsert_transaction_bottom_sheet/category_section.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/widgets/upsert_transaction_bottom_sheet/date_section.dart';
import 'package:bwai_bandung_hackathon/presentation/pages/home/widgets/upsert_transaction_bottom_sheet/note_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpsertTransactionBottomSheet extends StatefulWidget {
  const UpsertTransactionBottomSheet({
    super.key,
    this.transactionId,
  });

  final int? transactionId;

  @override
  State<UpsertTransactionBottomSheet> createState() =>
      _UpsertTransactionBottomSheetState();
}

class _UpsertTransactionBottomSheetState
    extends State<UpsertTransactionBottomSheet> {
  @override
  void initState() {
    super.initState();

    if (widget.transactionId != null) {
      context
          .read<FormTransactionCubit>()
          .getTransactionById(widget.transactionId!);
    } else {
      context.read<FormTransactionCubit>().getDefaultCategory();
    }
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
            context.read<AccountCubit>().getAccount();
            context.read<TransactionCubit>().getAll();
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
                    AmountSection(
                      amount: state.amount,
                      readOnly: widget.transactionId != null,
                    ),

                    // Note
                    NoteSection(
                      note: state.note,
                      readOnly: widget.transactionId != null,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Category
                        CategorySection(
                          selectedCategory: state.category,
                          readOnly: widget.transactionId != null,
                        ),

                        const SizedBox(width: 8.0),

                        // Date
                        DateSection(
                          selectedTransactionDate: state.transactionDate,
                          readOnly: widget.transactionId != null,
                        ),
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
                        onPressed: widget.transactionId != null
                            ? null
                            : context
                                .read<FormTransactionCubit>()
                                .upsertTransaction,
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
