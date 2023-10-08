import 'package:flutter/material.dart';

import 'card_tecnologia.dart';

class CardGrid extends StatelessWidget {
  final List<CardWidget> cards;

  const CardGrid({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tamanho = mediaQuery.size;
    return (tamanho.width > 600)
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9, // Você pode ajustar o número de colunas aqui
            ),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return cards[index];
            },
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Você pode ajustar o número de colunas aqui
            ),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return cards[index];
            },
          );
  }
}
