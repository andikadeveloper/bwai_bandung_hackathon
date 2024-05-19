import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/widgets/card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateSection extends StatelessWidget {
  const DateSection({
    super.key,
    required this.selectedTransactionDate,
    this.readOnly = false,
  });

  final DateTime selectedTransactionDate;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardButton(
        title: selectedTransactionDate.day == DateTime.now().day
            ? 'Today'
            : DateFormat.yMMMd().format(selectedTransactionDate),
        subtitle: 'Transaction Date',
        icon: const Icon(
          Icons.calendar_month,
        ),
        onPressed: () {
          if (readOnly) return;

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
