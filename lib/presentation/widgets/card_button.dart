import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final Icon icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: Color.fromARGB(255, 207, 205, 205),
          width: 0.3,
        ),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8.0),
        child: ListTile(
          title: Text(title, style: Theme.of(context).textTheme.labelLarge),
          subtitle: Text(subtitle,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: Colors.grey)),
          leading: icon,
        ),
      ),
    );
  }
}
