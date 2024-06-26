import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          context.push('/settings');
        },
      ),
      title: const Text('Gymbuddies'),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            context.push('/profile');
          },
        ),
      ],
    );
  }
}
