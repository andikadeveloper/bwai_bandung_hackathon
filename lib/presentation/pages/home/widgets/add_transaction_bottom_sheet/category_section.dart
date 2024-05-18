import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/widgets/card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.selectedCategoryId,
  });

  final int selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardButton(
        label: selectedCategoryId != 0
            ? selectedCategoryId.toString()
            : 'Category',
        icon: const Icon(
          Icons.credit_card,
          color: Colors.deepPurple,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Category $index'),
                    onTap: () {
                      context.pop();

                      context.read<FormTransactionCubit>().setCategoryId(index);
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
