import 'package:bwai_bandung_hackathon/core/extensions/string_extensions.dart';
import 'package:bwai_bandung_hackathon/domain/entities/category.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/category/category_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/cubit/form_transaction/form_transaction_cubit.dart';
import 'package:bwai_bandung_hackathon/presentation/widgets/card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.selectedCategory,
    this.readOnly = false,
  });

  final Category selectedCategory;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardButton(
        title: selectedCategory.name,
        subtitle: selectedCategory.type.name.capitalize(),
        icon: const Icon(
          Icons.credit_card,
          color: Colors.deepPurple,
        ),
        onPressed: () {
          if (readOnly) return;

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return SafeArea(
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () {
                        context.read<CategoryCubit>().getCategories();

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      success: (categories) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];

                            return ListTile(
                              title: Text(category.name),
                              subtitle: Text(category.type.name.capitalize()),
                              onTap: () {
                                context.pop();

                                context
                                    .read<FormTransactionCubit>()
                                    .setCategory(category);
                              },
                            );
                          },
                        );
                      },
                      failure: (message) {
                        return Center(
                          child: Text(message),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
