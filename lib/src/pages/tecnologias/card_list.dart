import 'package:flutter/material.dart';

import 'card_tecnologia.dart';

class CardGrid extends StatelessWidget {
  final List<CardWidget> cards;

  const CardGrid({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10, // Você pode ajustar o número de colunas aqui
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return cards[index];
      },
    );
  }
}
