import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyFloating extends StatelessWidget {
  const MyFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Add your onPressed code here!
      },
      child: const Icon(
        Icons.shopping_bag,
        color: Colors.white,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
