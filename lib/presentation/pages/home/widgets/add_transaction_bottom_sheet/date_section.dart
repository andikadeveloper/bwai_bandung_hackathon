import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/widgets/card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateSection extends StatelessWidget {
  const DateSection({
    super.key,
    required this.selectedTransactionDate,
  });

  final DateTime selectedTransactionDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardButton(
        label: selectedTransactionDate.isAtSameMomentAs(DateTime.now())
            ? 'Today'
            : selectedTransactionDate.toString().split(' ')[0],
        icon: const Icon(
          Icons.calendar_month,
        ),
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2200),
          ).then(
            (value) {
              if (value != null) {
                context.read<FormTransactionCubit>().setTransactionDate(value);
              }
            },
          );
        },
      ),
    );
  }
}
