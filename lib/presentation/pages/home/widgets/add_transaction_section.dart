import 'package:bwai_bandung_hackathon/presentation/widgets/card_button.dart';
import 'package:flutter/material.dart';

class AddTransactionSection extends StatelessWidget {
  const AddTransactionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
              padding: EdgeInsets.fromLTRB(
                16.0,
                16.0,
                16.0,
                MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        'Rp',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.grey,
                                ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          style: Theme.of(context).textTheme.headlineSmall,
                          decoration: InputDecoration(
                            hintText: 'Amount',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.grey,
                                ),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.send,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    style: Theme.of(context).textTheme.titleMedium,
                    decoration: InputDecoration(
                      hintText: 'Note',
                      hintStyle:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.grey,
                              ),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CardButton(
                          label: 'Category',
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
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: CardButton(
                          label: 'Today',
                          icon: const Icon(
                            Icons.calendar_month,
                          ),
                          onPressed: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2200),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
