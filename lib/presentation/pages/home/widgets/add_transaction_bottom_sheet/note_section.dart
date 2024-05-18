import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteSection extends StatefulWidget {
  const NoteSection({super.key});

  @override
  State<NoteSection> createState() => _NoteSectionState();
}

class _NoteSectionState extends State<NoteSection> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: context.read<FormTransactionCubit>().setNote,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        hintText: 'Note',
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.grey,
            ),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
    );
  }
}
