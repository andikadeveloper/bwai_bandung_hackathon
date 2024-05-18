import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountSection extends StatelessWidget {
  const AmountSection({super.key});

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
          ),
        ),
      ],
    );
  }
}
