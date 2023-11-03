import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  final String nome;
  final String enderecoImagem;

  const CardWidget(
      {super.key, required this.nome, required this.enderecoImagem});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final tamanho = mediaQuery.size;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Card(
        shadowColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
        // color: const Color(0xFF413A69),
        color: Theme.of(context).colorScheme.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/$enderecoImagem",
              fit: BoxFit.fill,
              height: (tamanho.width > 600) ? 50.0 : 30.0,
              width: (tamanho.width > 600) ? 50.0 : 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                nome,
                style: TextStyle(
                  fontSize: (tamanho.width > 600) ? 20.0 : 14.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
