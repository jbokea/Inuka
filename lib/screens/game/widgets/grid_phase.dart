import 'package:flutter/material.dart';

class GridPhase extends StatelessWidget {
  final List<String> gridSymbols;
  final Set<int> correctSelections;
  final void Function(String symbol) onSymbolTap;
  final String instruction;

  const GridPhase({
    super.key,
    required this.gridSymbols,
    required this.correctSelections,
    required this.onSymbolTap,
    required this.instruction,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 600 ? 5 : 8;
    final childAspectRatio = screenWidth < 600 ? 1.05 : 1.2;

    return Column(
      children: [
        const SizedBox(height: 12),
        Text(instruction, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            children: List.generate(gridSymbols.length, (index) {
              String symbol = gridSymbols[index];
              bool isSelected = correctSelections.contains(index);

              return GestureDetector(
                onTap: () => onSymbolTap(symbol),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: isSelected ? Colors.green : Colors.transparent,
                      width: 4,
                    ),
                    boxShadow: [
                      if (isSelected)
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        )
                    ],
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(symbol, fit: BoxFit.contain),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
