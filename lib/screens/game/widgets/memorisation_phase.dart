import 'package:flutter/material.dart';

class MemorisationPhase extends StatelessWidget {
  final String instruction;
  final String symbolPath;
  final List<String> interference;

  const MemorisationPhase({
    super.key,
    required this.instruction,
    required this.symbolPath,
    required this.interference,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(instruction, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 20),
          instruction == 'Mémorise'
              ? Image.asset(symbolPath, height: 130)
              : Text('${interference[0]} = ${interference[1]}',
                  style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
