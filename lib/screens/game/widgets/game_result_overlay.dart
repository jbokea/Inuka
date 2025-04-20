import 'package:flutter/material.dart';

class GameResultOverlay extends StatelessWidget {
  final String message;
  final bool isGameOver;
  final VoidCallback? onRestart;

  const GameResultOverlay({
    super.key,
    required this.message,
    this.isGameOver = false,
    this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          if (isGameOver && onRestart != null)
            ElevatedButton(
              onPressed: onRestart,
              child: const Text("Recommencer"),
            ),
        ],
      ),
    );
  }
}
