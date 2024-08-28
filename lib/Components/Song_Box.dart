import 'package:flutter/material.dart';

class SongBox extends StatelessWidget {
  final Widget? child;
  const SongBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            // darker shadow on botto right
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(4, 4),
            ),
            // lighter shadow on top left
            BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: const Offset(-4, -4),
            ),
          ]),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
