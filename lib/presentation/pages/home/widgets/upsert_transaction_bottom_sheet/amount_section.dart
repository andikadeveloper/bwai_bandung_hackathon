import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountSection extends StatefulWidget {
  const AmountSection({super.key, this.amount});

  final int? amount;

  @override
  State<AmountSection> createState() => _AmountSectionState();
}

class _AmountSectionState extends State<AmountSection> {
  final TextEditingController amountController = TextEditingController();

  @override
  void didUpdateWidget(covariant AmountSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    amountController.text = widget.amount?.toString() ?? '';
  }

  @override
  void dispose() {
    amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Rp',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey,
              ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: TextField(
            controller: amountController,
            onChanged: (value) {
              final amount = int.tryParse(value);
              context.read<FormTransactionCubit>().setAmount(amount ?? 0);
            },
            autofocus: true,
            style: Theme.of(context).textTheme.headlineSmall,
            decoration: InputDecoration(
              hintText: 'Amount',
              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.grey,
                  ),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) {
              context.read<FormTransactionCubit>().upsertTransaction();
            },
          ),
        ),
      ],
    );
  }
}
